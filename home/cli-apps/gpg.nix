{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400; # 24 hours.
    defaultCacheTtlSsh = 86400; # 24 hours.
    enableBashIntegration = true;
    enableSshSupport = true;
    maxCacheTtl = 86400;
    maxCacheTtlSsh = 86400;
    pinentryPackage = pkgs.pinentry-gnome3; # Previously `pkgs.pinentry-curses`.
  };
  programs.gpg = {
    enable = true;
  };
}
