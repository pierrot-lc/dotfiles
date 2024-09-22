{
  config,
  pkgs,
  ...
}: {
  # Enable ollama service (avoid the need of using `ollama serve`). The
  # acceleration is automatically detected if `nix.config.cudaSupport` or
  # `nix.config.rocmSupport` is set to `true`.
  services.ollama = {
    inherit (config.ollama) enable;
  };

  services.dbus.enable = true;
  services.flatpak.enable = true;
  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # services.mullvad-vpn.enable = true;

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [pkgs.cnijfilter2];
  };
  # Automatically detect new printers over the network.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Periodically update the database for the `locate` command.
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "hourly";
    localuser = null;
  };
}
