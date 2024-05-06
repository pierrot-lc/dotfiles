{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  programs.firefox.nativeMessagingHosts = [pkgs.bukubrow];

  shellAliases = {
    b = "buku --suggest";
    buku-fzf = "buku -p -f 4 | fzf";
    buku-url = "buku -p -f 4 | fzf | cut --fields=2";
    buku-push = "cd ~/.local/share/buku/; git add --all; git commit --message='update db'; git push; cd -";
    buku-pull = "cd ~/.local/share/buku/; git pull; cd -";
  };
}
