{private, ...}: {
  accounts.calendar.accounts.main = {
    primary = true;
    name = "main";
    remote.url = private.mails.calendar;
  };
}
