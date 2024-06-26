{
  pkgs,
  lib,
  config,
  ...
}: let
  private = import ./private.nix;
  OAuth2Settings = id: {
    "mail.smtpserver.smtp_${id}.authMethod" = 10;
    "mail.server.server_${id}.authMethod" = 10;
  };
  realName = "Pierre Pereira";
in {
  config = lib.mkIf config.accounts.enable {
    home.packages = with pkgs; [
      protonmail-bridge
      protonmail-bridge-gui
    ];

    programs.thunderbird = {
      enable = true;
      profiles.pierre = {
        isDefault = true;
        settings = {
          # See https://kb.mozillazine.org/Mail_and_news_settings.
          # "mail.identity.default.reply_on_top" = true;
          "mailnews.default_news_sort_order" = 2; # In descending order.
          "mailnews.default_news_sort_type" = 18; # Sort by date.
          "mailnews.default_sort_order" = 2; # In descending order.
          "mailnews.default_sort_type" = 18; # Sort by date.
          "mailnews.reply_on_top" = true; # Reply on top by default.
        };
      };
    };

    accounts.email.accounts = {
      "${private.outlook-1}" = {
        address = private.outlook-1;
        primary = true;
        inherit realName;

        thunderbird = {
          enable = true;
          profiles = ["pierre"];
          settings = OAuth2Settings;
        };

        flavor = "outlook.office365.com";
      };

      "${private.outlook-2}" = {
        address = private.outlook-2;
        inherit realName;

        thunderbird = {
          enable = true;
          profiles = ["pierre"];
          settings = OAuth2Settings;
        };

        flavor = "outlook.office365.com";
      };

      "${private.gmail}" = {
        address = private.gmail;
        inherit realName;

        thunderbird = {
          enable = true;
          profiles = ["pierre"];
          settings = OAuth2Settings;
        };

        flavor = "gmail.com";
      };

      "${private.polymtl.mail}" = {
        address = private.polymtl.mail;
        inherit realName;
        userName = private.polymtl.username;

        thunderbird = {
          enable = true;
          profiles = ["pierre"];
        };

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
          profiles = ["pierre"];
        };

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

      "${private.inria.mail}" = {
        address = private.inria.mail;
        inherit realName;
        userName = private.inria.username;

        thunderbird = {
          enable = true;
          profiles = ["pierre"];
        };

        smtp = {
          host = "smtp.inria.fr";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };

        imap = {
          host = "zimbra.inria.fr";
          port = 993;
          tls = {
            enable = true;
            useStartTls = false;
          };
        };
      };
    };
  };
}
