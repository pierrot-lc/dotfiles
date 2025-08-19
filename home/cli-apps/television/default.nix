{
  pkgs,
  config,
  ...
}: {
  programs.television.enable = true;
  home.packages = [pkgs.nix-search-tv];
  home.file."${config.xdg.configHome}/television/config.toml".source = ./config.toml;
  home.file."${config.xdg.configHome}/television/cable/".source = ./cable;

  home.shellAliases = {
    t = "tv text";
    r = "cd $(tv git-repos)";
    v = "tv files";
  };
}
