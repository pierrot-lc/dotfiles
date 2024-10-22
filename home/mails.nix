{
  pkgs,
  private,
  ...
}: let
  OAuth2Settings = id: {
    "mail.smtpserver.smtp_${id}.authMethod" = 10;
    "mail.server.server_${id}.authMethod" = 10;
  };
  realName = "Pierre Pereira";
in {
  home.packages = with pkgs; [
    protonmail-bridge
  ];

  programs.thunderbird = {
    enable = true;
    profiles.pierre = {
      isDefault = true;
      settings = {
        # See https://kb.mozillazine.org/Mail_and_news_settings.
        "mail.identity.default.reply_on_top" = true;
        "mailnews.default_news_sort_order" = 2; # In descending order.
        "mailnews.default_news_sort_type" = 18; # Sort by date.
        "mailnews.default_sort_order" = 2; # In descending order.
        "mailnews.default_sort_type" = 18; # Sort by date.
        "mailnews.reply_on_top" = 1; # Reply on top by default.
      };
    };
  };

  accounts.email.accounts = {
    "${private.mails.email-1.mail}" = {
      address = private.mails.email-1.mail;
      primary = true;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
        settings = OAuth2Settings;
      };

      flavor = private.mails.email-1.flavor;
    };

    "${private.mails.email-2.mail}" = {
      address = private.mails.email-2.mail;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
        settings = OAuth2Settings;
      };

      flavor = private.mails.email-2.flavor;
    };

    "${private.mails.email-3.mail}" = {
      address = private.mails.email-3.mail;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
        settings = OAuth2Settings;
      };

      flavor = private.mails.email-3.flavor;
    };

    "${private.mails.email-4.mail}" = {
      address = private.mails.email-4.mail;
      inherit realName;
      userName = private.mails.email-4.username;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
      };

      smtp = private.mails.email-4.smtp;
      imap = private.mails.email-4.imap;
    };

    "${private.mails.email-5.mail}" = {
      address = private.mails.email-5.mail;
      userName = private.mails.email-5.username;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
      };

      smtp = private.mails.email-5.smtp;
      imap = private.mails.email-5.imap;
    };

    "${private.mails.email-6.mail}" = {
      address = private.mails.email-6.mail;
      inherit realName;
      userName = private.mails.email-6.username;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
      };

      smtp = private.mails.email-6.smtp;
      imap = private.mails.email-6.imap;
    };

    "${private.mails.email-7.mail}" = {
      address = private.mails.email-7.mail;
      inherit realName;

      thunderbird = {
        enable = true;
        profiles = ["pierre"];
        settings = OAuth2Settings;
      };

      flavor = private.mails.email-7.flavor;
    };
  };
}
