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
    "melange" = {
      "dark" = "Melange_dark";
      "light" = "Melange_light";
    };
    "rose-pine" = {
      "dark" = "rose-pine";
      "light" = "rose-pine-dawn";
    };
  };

  darkTheme = themeParser.${config.theme.name}.dark;
  lightTheme = themeParser.${config.theme.name}.light;
in {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dark:${darkTheme},light:${lightTheme}";
    };
  };
}
