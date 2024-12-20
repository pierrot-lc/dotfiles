{config, ...}: {
  programs.mr = {
    enable = true;
    settings = {
      "${config.xdg.dataHome}/buku" = {
        checkout = "git clone git@gitea.com:pierrot-lc/buku.git";
      };
      "${config.xdg.dataHome}/contacts" = {
        checkout = "git clone git@gitea.com:pierrot-lc/contacts.git";
      };
      "${config.xdg.dataHome}/password-store" = {
        checkout = "git clone git@gitea.com:pierrot-lc/password-store.git";
      };
    };
  };

  home.shellAliases = {
    mru = "cd ~; mr run command git add .; mr commit -m myrepos-commit; mr update; mr push; cd -";
  };
}
