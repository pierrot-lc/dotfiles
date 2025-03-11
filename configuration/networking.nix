{lib, ...}: {
  networking = {
    # Enable networking.
    networkmanager.enable = lib.mkDefault true;

    openconnect.interfaces.inria = {
      autoStart = false;
      gateway = "vpn.inria.fr";
      protocol = "anyconnect";
      user = "pipereir";
      passwordFile = "/run/secrets/inria-vpn";
    };
  };
}
