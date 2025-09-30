{
  librewolf-nix = {
    enable = true;
    extraExtensions = {
      # Proton Pass
      "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4524394/proton_pass-latest.xpi";
        installation_mode = "force_installed";
        default_area = "navbar";
      };
      # Proton VPN
      "vpn@proton.ch" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4539502/proton_vpn_firefox_extension-1.2.9.xpi";
        installation_mode = "force_installed";
        default_area = "navbar";
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1;
  };
  systemd.user.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1;
  };
}
