{
  private,
  lib,
  ...
}: {
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        compression = false;
        forwardAgent = false;
        hashKnownHosts = false;
        serverAliveInterval = 0;
      };

      "nef-frontal" = {
        hostname = "nef-frontal.inria.fr";
        user = "pipereir";
        identityFile = "~/.ssh/id_ed25519_nef";
      };
      "nef-devel" = lib.hm.dag.entryBefore ["nef-frontal"] {
        hostname = "nef-devel.inria.fr";
        user = "pipereir";
        identityFile = "~/.ssh/id_ed25519_nef";
        proxyJump = "nef-frontal";
      };
      "grid5000" = {
        hostname = "access.grid5000.fr";
        user = "ppereira";
        identityFile = "~/.ssh/id_ed25519_nef";
      };
      "abaca" = lib.hm.dag.entryBefore ["grid5000"] {
        hostname = "sophia";
        user = "ppereira";
        identityFile = "~/.ssh/id_ed25519_nef";
        proxyJump = "grid5000";
      };

      "maserati" = {
        hostname = "maserati.inria.fr";
        user = "pipereir";
        identityFile = "~/.ssh/id_rsa_maserati";
      };
      "antipasti" = {
        hostname = "antipasti.inria.fr";
        user = "pipereir";
        identityFile = "~/.ssh/id_rsa_maserati";
      };

      "home" = {
        hostname = private.networking.box.ip;
        port = private.networking.box.ssh-port;
        user = "pierrot-lc";
        identityFile = "~/.ssh/id_ed25519_raspi-4";
      };
      "raspi-4" = {
        hostname = private.networking.raspi-4.ip;
        user = "pierrot-lc";
        identityFile = "~/.ssh/id_ed25519_raspi-4";
      };
    };
  };
}
