{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
  };

  home.packages = [pkgs.firefoxpwa];

  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 0;  # Explicit-sync makes Firefox crash. See https://bugzilla.mozilla.org/show_bug.cgi?id=1898476.
  };
}
