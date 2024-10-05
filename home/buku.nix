{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  shellAliases = {
    b = "buku --suggest";
    buku-pull = "cd $XDG_DATA_HOME/buku/; git pull; cd -";
    buku-push = "cd $XDG_DATA_HOME/buku/; git add --all; git commit --message='update db'; git push; cd -";
    fzf-buku = "buku -p -f 4 | fzf";
    fzf-buku-url = "buku -p -f 4 | fzf | cut --fields=2";
  };
}
