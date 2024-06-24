{config, ...}: let
  # Those are the themes that are builtin in kitty. There's no need to source them.
  themeParser = {
    "catppuccin" = "Catppuccin-Frappe";
    "everforest" = "Everforest Dark Hard";
    "gruvbox" = "Gruvbox Material Dark Soft";
    "kanagawa" = "Kanagawa_dragon";
    "nord" = "Nord";
    "rose-pine" = "Rosé Pine Moon";
    "rose-pine-dawn" = "Rosé Pine Dawn";
  };
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
    theme = themeParser.${config.theme.name};
    shellIntegration.enableBashIntegration = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
