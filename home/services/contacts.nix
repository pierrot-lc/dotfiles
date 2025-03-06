{config, ...}: {
  accounts.contact.accounts.main = {
    local = {
      path = "${config.xdg.dataHome}/contacts/";
      type = "filesystem";
    };
  };
}
