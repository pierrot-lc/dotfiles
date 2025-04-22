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
    "gruvbox" = {
      "dark" = "GruvboxDarkHard";
      "light" = "GruvboxLightHard";
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
