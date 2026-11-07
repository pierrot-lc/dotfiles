{
  programs.papis = {
    enable = true;
    settings = {
      use_git = true;
    };
    libraries."default" = {
      isDefault = true;
      name = "default";
      settings.dir = "~/Papers/";
    };
  };
}
