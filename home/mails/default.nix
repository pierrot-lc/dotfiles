{ pkgs, ... }:

let
  private = import ./private.nix;
in
{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  programs.aerc.enable = true;
  programs.aerc.extraConfig.general.unsafe-accounts-conf = true;

  accounts.email.accounts = {
    perso-outlook = {
      address = private.outlook_1;
      primary = true;

      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      aerc.enable = true;

      flavor = "outlook.office365.com";
      passwordCommand = private.pass_outlook_1;
      realName = "Pierrot LC";
    };
  };
}
