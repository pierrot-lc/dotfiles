let
  private = import ./private.nix;
in
{
  programs.qcal = {
    enable = true;
  };

  accounts.calendar.accounts.proton-calendar = {
    primary = true;
    name = "proton-calendar";
    remote.url = private.proton-calendar;

    qcal.enable = true;
  };
}
