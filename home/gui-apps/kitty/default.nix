{config, ...}: let
  # Those are the themes that are builtin in kitty. There's no need to source them.
  themeParser = {
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
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
    themeFile = themeParser.${config.theme.name}.${config.theme.flavour};
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
