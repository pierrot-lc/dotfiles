{config, ...}: let
  themeParser = {
    "catppuccin-macchiato" = {
      "dark" = "Catppuccin Macchiato";
      "light" = "Catppuccin Frappe";
    };
    "catppuccin-mocha" = {
      "dark" = "Catppuccin Mocha";
      "light" = "Catppuccin Latte";
    };
    "gruvbox" = {
      "dark" = "Gruvbox Dark Hard";
      "light" = "Gruvbox Light Hard";
    };
    "melange" = {
      "dark" = "Melange Dark";
      "light" = "Melange Light";
    };
    "rose-pine" = {
      "dark" = "Rose Pine";
      "light" = "Rose Pine Dawn";
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
