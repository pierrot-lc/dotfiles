{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  programs.firefox.nativeMessagingHosts = [pkgs.bukubrow];

  shellAliases = {
    b = "buku --suggest";
    bfzf = "buku -p -f 4 | fzf";
    burl = "buku -p -f 4 | fzf | cut --fields=2";
    bpush = "cd ~/.local/share/buku/; git add --all; git commit --message='update db'; git push; cd -";
    bpull = "cd ~/.local/share/buku/; git pull; cd -";
  };
}
