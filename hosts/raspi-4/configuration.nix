{
  pkgs,
  private,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

  # Overwrite some default settings.
  services.printing.enable = false;
  services.avahi.enable = false;

  # Add my local wifi.
  networking = {
    inherit (private.networking) wireless;
    networkmanager.enable = false;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
  users.users.pierrot-lc.openssh.authorizedKeys.keys = [private.networking.raspi-4_pub];
}
