{
  programs.khard = {
    enable = true;
    settings = {
      general.editor = ["nvim" "-i" "none"];
      general.merge_editor = ["nvim" "-d"];
    };
  };

  accounts.contact.accounts.main = {
    khard.enable = true;
  };
}
