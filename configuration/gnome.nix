{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "pierrot-lc";

    # Workaround for gnome autologin: https://github.com/nixos/nixpkgs/issues/103746#issuecomment-945091229.
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;

    services.gnome.gnome-keyring.enable = true;

    # Exclude some gnome packages installed by default when using gnome.
    services.gnome.games.enable = false;
    programs.geary.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      cheese
      epiphany
      evince
      gnome-terminal
      gnome-tour
    ];

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      dconf-editor
      gnome-tweaks
      papers
    ];
  };
}
