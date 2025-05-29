{
  pkgs,
  config,
  ...
}: let
  sources = pkgs.callPackage ./_sources/generated.nix {};

  themes = {
    catppuccin-frappe = {
      src = sources.catppuccin.src;
      file = "themes/Catppuccin Frappe.tmTheme";
    };
    catppuccin-latte = {
      src = sources.catppuccin.src;
      file = "themes/Catppuccin Latte.tmTheme";
    };
    catppuccin-macchiato = {
      src = sources.catppuccin.src;
      file = "themes/Catppuccin Macchiato.tmTheme";
    };
    catppuccin-mocha = {
      src = sources.catppuccin.src;
      file = "themes/Catppuccin Mocha.tmTheme";
    };
    rose-pine-dark = {
      src = sources.rose-pine.src;
      file = "dist/themes/rose-pine.tmTheme";
    };
    rose-pine-light = {
      src = sources.rose-pine.src;
      file = "dist/themes/rose-pine-dawn.tmTheme";
    };
  };

  themeParser = {
    "catppuccin-macchiato" = {
      "dark" = "catppuccin-macchiato";
      "light" = "catppuccin-frappe";
    };
    "catppuccin-mocha" = {
      "dark" = "catppuccin-mocha";
      "light" = "catppuccin-latte";
    };
    "gruvbox" = {
      "dark" = "gruvbox-dark";
      "light" = "gruvbox-light";
    };
    "melange" = {
      "dark" = "gruvbox-dark";
      "light" = "gruvbox-light";
    };
    "rose-pine" = {
      "dark" = "rose-pine-dark";
      "light" = "rose-pine-light";
    };
  };
in {
  programs.bat = {
    enable = true;
    config = {
      theme = themeParser.${config.theme.name}.${config.theme.flavour};
      italic-text = "always";
    };
    inherit themes;
  };

  home.shellAliases = {
    cat = "bat";
  };
}
