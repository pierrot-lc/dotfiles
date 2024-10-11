{pkgs, ...}: {
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
}
