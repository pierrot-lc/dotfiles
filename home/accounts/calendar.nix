{
  config,
  lib,
  ...
}: let
  private = import ./private.nix;
in {
  config = lib.mkIf config.accounts.enable {
    programs.qcal = {
      enable = true;
    };

    accounts.calendar.accounts.proton-calendar = {
      primary = true;
      name = "proton-calendar";
      remote.url = private.proton-calendar;

      qcal.enable = true;
    };
  };
}
