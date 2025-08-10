{pkgs, ...}: {
  home.packages = [pkgs.buku];

  programs.git.extraConfig = {
    merge.buku-driver = {
      name = "Custom buku merge driver, handling the bookmarks SQLite database";
      driver = "nix run 'github:pierrot-lc/buku-merger' -- %O %A %B";
      recursive = "binary";
    };
  };
}
