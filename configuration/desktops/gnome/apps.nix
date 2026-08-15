{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "GNOME") {
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
