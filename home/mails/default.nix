{ lib, ... }:
let
  private = import ./private.nix;
in
{
  programs.thunderbird = {
    enable = true;
    profiles.pierre = {
      isDefault = true;
    };
  };

  accounts.email.accounts = {
    "${private.outlook-1}" = {
      address = private.outlook-1;
      primary = true;
      realName = "Pierrot LC";

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
      };

      flavor = "outlook.office365.com";
      smtp.host = lib.mkForce "smtp-mail.outlook.com";
      passwordCommand = private.pass-outlook-1;
    };

    "${private.outlook-2}" = {
      address = private.outlook-2;
      realName = "Pierre Pereira";

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
      };

      flavor = "outlook.office365.com";
      smtp.host = lib.mkForce "smtp-mail.outlook.com";
      passwordCommand = private.pass-outlook-2;
    };

    "${private.gmail}" = {
      address = private.gmail;
      realName = "Pierre Pereira";

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
      };

      flavor = "gmail.com";
      passwordCommand = private.pass-gmail;
    };

    "${private.polymtl}" = {
      address = private.polymtl;
      realName = "Pierre Pereira";
      userName = private.user-polymtl;

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
      };

      passwordCommand = private.pass-polymtl;
      smtp = {
        host = "smtp.polymtl.ca";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };

      imap = {
        host = "imap.polymtl.ca";
        port = 143;
        tls.enable = false;
      };
    };
  };
}
