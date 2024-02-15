{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
    theme = "kanagawabones";
    shellIntegration.enableBashIntegration = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
