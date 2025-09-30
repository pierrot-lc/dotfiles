{
  pkgs,
  config,
  ...
}: let
  builtinThemes = {
    "catppuccin-macchiato" = {
      "dark" = "Catppuccin-Macchiato";
      "light" = "Catppuccin-Frappe";
    };
    "catppuccin-mocha" = {
      "dark" = "Catppuccin-Mocha";
      "light" = "Catppuccin-Latte";
    };
    "gruvbox" = {
      "dark" = "gruvbox-dark-hard";
      "light" = "gruvbox-light-hard";
    };
    "rose-pine" = {
      "dark" = "rose-pine";
      "light" = "rose-pine-dawn";
    };
  };

  sources = pkgs.callPackage ./_sources/generated.nix {};
  extraThemes = {
    "melange" = {
      "dark" = builtins.readFile "${sources.melange.src}/term/kitty/melange_dark.conf";
      "light" = builtins.readFile "${sources.melange.src}/term/kitty/melange_light.conf";
    };
  };
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
      extraThemes.${config.theme.name}.${config.theme.flavour} or ""
    ];
    themeFile = builtinThemes.${config.theme.name}.${config.theme.flavour} or null;
  };

  home.sessionVariables.TERMINAL = "kitty";
  systemd.user.sessionVariables.TERMINAL = "kitty";
}
