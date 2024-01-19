{ config, pkgs, lib, ... }:

{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };

  accounts.email.accounts = {
    perso-outlook = {
      address = "pstmrtem@outlook.com";
      primary = true;

      mbsync = {
        enable = false;
        create = "maildir";
      };
      msmtp.enable = false;
      notmuch.enable = false;

      realName = "Pierrot LC";
      userName = "pstmrtem@outlook.com";

      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.enable = true;
      };
    };
  };
}
