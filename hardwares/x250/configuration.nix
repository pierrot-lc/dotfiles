# This is some specific configuration for the given machine.

{ config, pkgs, ... }:

{
  networking.hostName = "x250";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}
