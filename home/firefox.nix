{pkgs, ...}: {
  librewolf-nix = {
    enable = true;
    extraExtensions = {
      # Bukubrow
      "bukubrow@samhh.com" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/3769984/bukubrow-latest.xpi";
        installation_mode = "force_installed";
      };
    };
    nativeMessagingHosts = with pkgs; [bukubrow];
  };

  home.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1;
  };
}
