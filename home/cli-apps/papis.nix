{
  programs.papis = {
    enable = true;
    libraries."default" = {
      isDefault = true;
      name = "default";
      settings.dir = "~/Papers/";
    };
  };
}
