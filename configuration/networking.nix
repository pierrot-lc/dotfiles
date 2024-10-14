{private, ...}: {
  networking = {
    # Enable networking.
    networkmanager.enable = true;

    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };

    # firewall = {
    #   enable = false; # Or disable the firewall altogether.
    #   # Open ports in the firewall.
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    # };
    openconnect.interfaces.inria = {
      autoStart = false;
      gateway = "vpn.inria.fr";
      protocol = "anyconnect";
      user = private.mails.email-6.username;
      passwordFile = "/run/secrets/inria-vpn";
    };
  };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
