{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
  };

  home.packages = [pkgs.firefoxpwa];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
