{private, ...}: {
  home.file.".cups/client.conf".text = ''
    User ${private.email-6.username}
    AllowAnyRoot Yes
    ValidateCerts No
    ServerName cups-SAM.inria.fr
  '';
}
