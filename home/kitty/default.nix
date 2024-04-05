{
  lib,
  theme,
  ...
}: let
  # Those are the themes that are builtin in kitty. There's no need to source them.
  builtinThemes = {
    "catppuccin" = "Catppuccin-Frappe";
    "everforest" = "Everforest Dark Hard";
    "gruvbox" = "Gruvbox Material Dark Soft";
  };
  themeName =
    if builtins.hasAttr theme builtinThemes
    then builtinThemes.${theme}
    else null;

  # Those are the themes that are not builtin in kitty. They need to be sourced.
  extraThemes = {
    "kanagawa" = builtins.readFile ./kanagawa_dragon.conf;
  };
  extraConfig = lib.optionalString (builtins.hasAttr theme extraThemes) extraThemes.${theme};
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
      extraConfig
    ];
    theme = themeName;
    shellIntegration.enableBashIntegration = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
