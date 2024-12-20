{config, ...}: {
  accounts.contact.accounts.main = {
    khard = {
      enable = true;
    };

    local = {
      path = "${config.xdg.dataHome}/contacts/";
      type = "filesystem";
    };
  };

  programs.khard = {
    enable = true;
    settings = {
      general.editor = ["nvim" "-i" "NONE"];
      general.merge_editor = ["nvim" "-d"];
    };
  };
}
