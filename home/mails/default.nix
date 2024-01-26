{ lib, pkgs, ... }:
let
  private = import ./private.nix;
  OAuth2Settings = id: {
    "mail.smtpserver.smtp_${id}.authMethod" = 10;
    "mail.server.server_${id}.authMethod" = 10;
  };
  realName = "Pierre Pereira";
in
{
  home.packages = with pkgs; [
    protonmail-bridge
  ];

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
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
        settings = OAuth2Settings;
      };

      flavor = "outlook.office365.com";
      passwordCommand = private.pass-outlook-1;
    };

    "${private.outlook-2}" = {
      address = private.outlook-2;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
        settings = OAuth2Settings;
      };

      flavor = "outlook.office365.com";
      passwordCommand = private.pass-outlook-2;
    };

    "${private.gmail}" = {
      address = private.gmail;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
        settings = OAuth2Settings;
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

    "${private.proton}" = {
      address = private.proton;
      userName = private.proton;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = [ "pierre" ];
      };

      passwordCommand = private.pass-proton;
      smtp = {
        host = "127.0.0.1";
        port = 1025;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };

      imap = {
        host = "127.0.0.1";
        port = 1143;
        tls = {
          enable = false;
          useStartTls = false;
        };
      };
    };
  };
}
