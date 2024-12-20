# Valid themes should do a lot of things:
# - support a wide range of applications
# - have a dark and light version
# - be open source and have a nice community around it
#
# List of currently impacted applications that themes must support:
# - bat (fzf, git-delta)
# - kitty
# - nvim (should support common plugins such as mini.nvim)
#
# Valid themes:
# - [catppuccin](https://catppuccin.com/)
# - [everforest](https://github.com/sainnhe/everforest/wiki)
# - [gruvbox](https://github.com/gruvbox-community/gruvbox-contrib)
# - [rosé-pine](https://rosepinetheme.com/)
{lib, ...}: {
  options = {
    theme = {
      name = lib.mkOption {
        type = lib.types.enum [
          "catppuccin-macchiato"
          "catppuccin-mocha"
          "everforest"
          "gruvbox"
          "rose-pine"
        ];
        default = "catppuccin-mocha";
        description = "The global theme to use.";
      };
      flavour = lib.mkOption {
        type = lib.types.enum ["dark" "light"];
        default = "dark";
        description = "Version of the theme to use";
      };
    };
  };
}
