{
  pkgs,
  lib,
  ...
}: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = lib.mkDefault true;
    drivers = [pkgs.cnijfilter2];
  };

  users.extraGroups.lpadmin.members = ["pierrot-lc"];

  # Automatically detect new printers over the network.
  services.avahi = {
    enable = lib.mkDefault true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
