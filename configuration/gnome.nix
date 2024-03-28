{pkgs, ...}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "pierrot-lc";

  # workaround for gnome autologin: https://github.com/nixos/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Exclude some gnome packages installed by default when using gnome.
  environment.gnome.excludePackages =
    (
      with pkgs; [
        gnome-photos
        gnome-tour
      ]
    )
    ++ (
      with pkgs.gnome; [
        cheese
        epiphany
        geary
        gnome-music
        gnome-terminal
        hitori
        iagno
        tali
        totem
      ]
    );

  environment.systemPackages = with pkgs; [
    gnome-extension-manager
    gnome.adwaita-icon-theme
  ];
}
