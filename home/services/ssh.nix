{private, ...}: {
  programs.ssh = {
    enable = true;
    extraConfig = /* sshconfig */ ''
        Host nef-frontal
            HostName nef-frontal.inria.fr
            User pipereir
            IdentityFile ~/.ssh/id_ed25519_nef

        Host nef-devel
            HostName nef-devel.inria.fr
            User pipereir
            IdentityFile ~/.ssh/id_ed25519_nef
            proxyjump nef-frontal

        Host maserati
            HostName maserati.inria.fr
            User pipereir
            IdentityFile ~/.ssh/id_rsa_maserati

        Host antipasti
            HostName antipasti.inria.fr
            User pipereir
            IdentityFile ~/.ssh/id_rsa_maserati

        Host grid5000
            HostName access.grid5000.fr
            User ppereira
            IdentityFile ~/.ssh/id_ed25519_nef

        Host abaca
            HostName sophia
            User ppereira
            IdentityFile ~/.ssh/id_rsa_abaca
            proxyjump grid5000

        Host rennes
            HostName rennes
            User ppereira
            IdentityFile ~/.ssh/id_rsa_abaca
            proxyjump grid5000

        Host home
            HostName ${private.networking.box.ip}
            Port ${private.networking.box.ssh-port}
            User pierrot-lc
            IdentityFile ~/.ssh/id_ed25519_raspi-4

        Host raspi-4
            HostName ${private.networking.raspi-4.ip}
            User pierrot-lc
            IdentityFile ~/.ssh/id_ed25519_raspi-4
      '';
  };
}
