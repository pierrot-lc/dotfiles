{
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
    '';
  };
}
