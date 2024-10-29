{pkgs, ...}: {
  librewolf-nix = {
    enable = true;
    nativeMessagingHosts = with pkgs; [bukubrow];
  };

  home.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1;
  };
}
