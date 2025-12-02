{
  config,
  pkgs,
  ...
}: {
  services.dbus.enable = true;
  services.flatpak.enable = true;
  services.fwupd.enable = true;
  services.hardware.openrgb.enable = true;

  # Periodically update the database for the `locate` command.
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "hourly";
  };
}
