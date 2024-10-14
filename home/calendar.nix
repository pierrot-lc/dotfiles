{private, ...}: {
  programs.qcal = {
    enable = true;
  };

  accounts.calendar.accounts.proton-calendar = {
    primary = true;
    name = "proton-calendar";
    remote.url = private.mails.email-5.calendar;

    qcal.enable = true;
  };
}
