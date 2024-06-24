{lib, ...}: let
  validThemes = [
    "catppuccin"
    "everforest"
    "gruvbox"
    "kanagawa"
    "nord"
    "rose-pine"
    "rose-pine-dawn"
  ];
in {
  options = {
    theme.name = lib.mkOption {
      type = lib.types.enum validThemes;
      default = "gruvbox";
      description = "The global theme to use.";
    };
  };
}
