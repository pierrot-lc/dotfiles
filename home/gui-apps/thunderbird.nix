{
  pkgs,
  lib,
  private,
  ...
}: let
  OAuth2Settings = id: {
    "mail.smtpserver.smtp_${id}.authMethod" = 10;
    "mail.server.server_${id}.authMethod" = 10;
  };

  # OAuth2Settings is needed if the account is either a gmail or an outlook
  # account.
  setParams = mailAttrs: let
    flavor =
      if mailAttrs ? flavor
      then mailAttrs.flavor
      else "plain";
    settings =
      if lib.elem flavor ["gmail.com" "outlook.office365.com"]
      then OAuth2Settings
      else _: {};
  in {
    enable = true;
    inherit settings;
    profiles = ["main"];
  };
in {
  home.packages = with pkgs; [
    protonmail-bridge
  ];

  programs.thunderbird = {
    enable = true;
    profiles.main = {
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

  accounts.email.accounts =
    lib.concatMapAttrs (mail: attrs: {
      mail = attrs // {thunderbird = setParams attrs;};
    })
    private.mails.accounts;
}
