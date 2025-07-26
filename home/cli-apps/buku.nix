{pkgs, ...}: {
  home.packages = [pkgs.buku];

  home.shellAliases = {
    b = "buku --suggest";
    fzf-buku = "buku -p -f 4 | fzf";
    fzf-buku-url = "buku -p -f 4 | fzf | cut --fields=2";
  };

  programs.git.extraConfig = {
    merge.buku-driver = {
      name = "Custom buku merge driver, handling the bookmarks SQLite database";
      driver = "nix run 'github:pierrot-lc/buku-merger' -- %O %A %B";
      recursive = "binary";
    };
  };
}
