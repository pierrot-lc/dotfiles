{config, ...}: {
  programs.mr = {
    enable = true;
    settings = {
      "${config.xdg.dataHome}/password-store" = {
        checkout = "git clone git@gitea.com:pierrot-lc/password-store.git";
      };
      "${config.xdg.dataHome}/buku" = {
        checkout = "git clone git@gitea.com:pierrot-lc/buku.git";
      };
    };
  };

  shellAliases = {
    mru = "cd ~; mr update; cd -";
    mrc = "cd ~; mr commit -m myrepos-commit; cd -";
  };
}
