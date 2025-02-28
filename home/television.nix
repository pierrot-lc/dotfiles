{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.television pkgs.nix-search-tv];
  home.file."${config.xdg.configHome}/television/config.toml".text = /* toml */ ''
      [ui]
      use_nerd_font_icons = true
      input_bar_position = "top"

      [previewers.file]
      theme = "${config.programs.bat.config.theme}"
    '';

  home.file."${config.xdg.configHome}/television/channels.toml".text = /* toml */ ''
      [[cable_channel]]
      name = "nixpkgs"
      source_command = "nix-search-tv print"
      preview_command = "nix-search-tv preview {}"
  '';

  home.shellAliases = {
    t = "cd $(tv git-repos)";
    v = "nvim $(tv)";
    n = "tv nixpkgs";
  };
}
