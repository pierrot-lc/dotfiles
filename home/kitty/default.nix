{config, ...}: let
  # Those are the themes that are builtin in kitty. There's no need to source them.
  themeParser = {
    "catppuccin" = "Catppuccin-Frappe";
    "everforest" = "everforest_dark_hard";
    "gruvbox" = "GruvboxMaterialDarkSoft";
    "kanagawa" = "kanagawa_dragon";
    "nord" = "Nord";
    "rose-pine" = "rose-pine-moon";
    "rose-pine-dawn" = "rose-pine-dawn";
  };
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
    themeFile = themeParser.${config.theme.name};
    shellIntegration.enableBashIntegration = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
