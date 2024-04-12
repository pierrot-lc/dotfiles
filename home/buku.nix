{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  programs.firefox.nativeMessagingHosts = [pkgs.bukubrow];

  programs.bash.shellAliases = {
    b = "buku --suggest";
    bfzf = "buku -p -f 4 | fzf";
    burl = "buku -p -f 4 | fzf | cut --fields=2";
  };
}
