{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "pierrot-lc";

    services.gnome.gnome-keyring.enable = true;

    # Exclude some gnome packages installed by default when using gnome.
    services.gnome.games.enable = false;
    programs.geary.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      cheese
      epiphany
      evince
      gnome-music
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
