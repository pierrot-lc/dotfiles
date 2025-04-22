{config, ...}: let
  themeParser = {
    "catppuccin-macchiato" = {
      "dark" = "catppuccin-macchiato";
      "light" = "catppuccin-frappe";
    };
    "catppuccin-mocha" = {
      "dark" = "catppuccin-mocha";
      "light" = "catppuccin-latte";
    };
    "everforest" = {
      "dark" = "everforest_dark_hard";
      "light" = "everforest_light_hard";
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
  programs.ghostty = {
    enable = true;
    settings = {
      theme = themeParser.${config.theme.name}.${config.theme.flavour};
    };
  };
}
