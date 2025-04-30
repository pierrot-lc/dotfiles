{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400; # 24 hours.
    defaultCacheTtlSsh = 86400; # 24 hours.
    enableBashIntegration = true;
    enableSshSupport = true;
    maxCacheTtl = 86400;
    maxCacheTtlSsh = 86400;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  programs.gpg = {
    enable = true;
  };
}
