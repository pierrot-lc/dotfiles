{
  pkgs,
  lib,
  config,
  ...
}: let
  themeParser = {
    "catppuccin-macchiato" = {
      "dark" = "blue";
      "light" = "slate";
    };
    "catppuccin-mocha" = {
      "dark" = "purple";
      "light" = "blue";
    };
    "gruvbox" = {
      "dark" = "orange";
      "light" = "yellow";
    };
    "melange" = {
      "dark" = "yellow";
      "light" = "teal";
    };
    "rose-pine" = {
      "dark" = "purple";
      "light" = "red";
    };
  };

  colorScheme = {
    "dark" = "prefer-dark";
    "light" = "default";
  };
in {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = themeParser.${config.theme.name}.${config.theme.flavour};
            color-scheme = colorScheme.${config.theme.flavour};
          };
        };
      }
    ];
  };
}
