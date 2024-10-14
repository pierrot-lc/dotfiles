{private, ...}: {
  home.file.".cups/client.conf".text = ''
    User ${private.mails.email-6.username}
    AllowAnyRoot Yes
    ValidateCerts No
    ServerName cups-SAM.inria.fr
  '';
}
