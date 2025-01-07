{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.television];
  home.file."${config.xdg.configHome}/television/config.toml".text = /* toml */ ''
      [ui]
      use_nerd_font_icons = true
    '';

  home.shellAliases = {
    t = "cd `tv git-repos`";
    v = "nvim `tv`";
  };
}
