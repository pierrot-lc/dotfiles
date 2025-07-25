{
  librewolf-nix = {
    enable = true;
    extraExtensions = {
      # Proton Pass
      "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4440138/proton_pass-latest.xpi";
        installation_mode = "force_installed";
        default_area = "navbar";
      };
      # Proton VPN
      "vpn@proton.ch" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4413146/proton_vpn_firefox_extension-latest.xpi";
        installation_mode = "force_installed";
        default_area = "navbar";
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1;
  };
}
