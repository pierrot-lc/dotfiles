{
  pkgs,
  config,
  ...
}: let
  # Sadly not all themes are available right now. Since the app is still in a
  # fast-moving state, I don't want to rush adding the missing ones. Let's wait
  # for themes to stabilize a bit.
  themeParser = {
    catppuccin-macchiato = {
      dark = "catppuccin";
      light = "catppuccin";
    };
    catppuccin-mocha = {
      dark = "catppuccin";
      light = "catppuccin";
    };
    everforest = {
      dark = "monokai";
      light = "monokai";
    };
    gruvbox = {
      dark = "gruvbox-dark";
      light = "gruvbox-light";
    };
    rose-pine = {
      dark = "catppuccin";
      light = "solarized-light";
    };
  };
  theme = themeParser.${config.theme.name}.${config.theme.flavour};
in {
  home.packages = [pkgs.television];
  home.file."${config.xdg.configHome}/television/config.toml".text = /* toml */ ''
      [ui]
      use_nerd_font_icons = true

      [previewers.file]
      theme = "${theme}"
    '';

  home.shellAliases = {
    t = "cd `tv git-repos`";
    v = "nvim `tv`";
  };
}
