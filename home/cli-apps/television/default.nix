{
  pkgs,
  config,
  ...
}: {
  # TODO: Add tv text -> vim opening
  # TODO: Add bash integration, removing fzf ?
  # TODO: Add fzf sources as channels
  programs.television.enable = true;
  home.packages = [pkgs.nix-search-tv];
  home.file."${config.xdg.configHome}/television/config.toml".source = ./config.toml;
  home.file."${config.xdg.configHome}/television/cable/".source = ./cable;

  home.shellAliases = {
    b = "tv buku";
    n = "tv nix";
    r = "cd $(tv git-repos)";
    v = "nvim $(tv files)";
  };
}
