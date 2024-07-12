{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    # nativeMessagingHosts = [pkgs.firefoxpwa];
  };

  # home.packages = [pkgs.firefoxpwa];

  home.sessionVariables = {
    BROWSER = "librewolf";
    # See https://bugzilla.mozilla.org/show_bug.cgi?id=1898476 and https://gitlab.gnome.org/GNOME/mutter/-/issues/3504.
    MOZ_ENABLE_WAYLAND = 0; # Explicit-sync on wayland makes Firefox crash.
  };
}
