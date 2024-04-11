{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  programs.firefox.nativeMessagingHosts = [pkgs.bukubrow];
}
