{pkgs, ...}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "pierrot-lc";

  # workaround for gnome autologin: https://github.com/nixos/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Exclude some gnome packages installed by default when using gnome.
  services.gnome.games.enable = false;
  programs.geary.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    cheese
    epiphany
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    totem
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    dconf-editor
    gnome-extension-manager
    gnome-tweaks
  ];
}
