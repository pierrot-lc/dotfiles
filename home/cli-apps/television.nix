{
  pkgs,
  config,
  ...
}: {
  # TODO: Add tv text -> vim opening
  # TODO: Add bash integration, removing fzf ?
  # TODO: Add fzf sources as channels
  home.packages = [pkgs.television pkgs.nix-search-tv];
  home.file."${config.xdg.configHome}/television/config.toml".text = /* toml */ ''
      [ui]
      use_nerd_font_icons = true
      input_bar_position = "top"
    '';

  home.file."${config.xdg.configHome}/television/cable/nix-search.toml".text = /* toml */ ''
      [metadata]
      name = "nix"
      description = "Search through nixpkgs, home-manager and nixos options"
      requirements = ["nix-search-tv"]

      [source]
      command = "nix-search-tv print"

      [preview]
      command = "nix-search-tv preview {}"
    '';

  home.shellAliases = {
    n = "wl-copy $(tv nix)";
    r = "cd $(tv git-repos)";
    v = "nvim $(tv files)";
  };
}
