{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "x250";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
