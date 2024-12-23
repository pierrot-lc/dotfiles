{private, ...}: {
  programs.qcal = {
    enable = true;
  };

  accounts.calendar.accounts.main = {
    primary = true;
    name = "main";
    remote.url = private.mails.calendar;

    qcal.enable = true;
  };
}
