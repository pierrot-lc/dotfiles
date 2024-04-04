{theme, ...}: let
  themeName = {
    "everforest" = "Everforest Dark Hard";
    "catppuccin" = "Catppuccin-Frappe";
  };
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
    theme = themeName.${theme};
    shellIntegration.enableBashIntegration = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
