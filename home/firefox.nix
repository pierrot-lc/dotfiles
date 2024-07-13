{pkgs, ...}: {
  # TODO: https://librewolf.net/docs/settings/#enable-webgl
  # TODO: https://nixos.wiki/wiki/Firefox
  # TODO: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  # TODO: https://librewolf.net/docs/faq/
  # TODO: https://github.com/chayleaf/dotfiles/blob/543611983cd66449378ada55e33d6d0bff7a6e55/home/modules/firefox.nix#L8
  # TODO: https://librewolf.net/docs/faq/#how-do-i-get-native-messaging-to-work
  programs.firefox = {
    enable = true;

    profiles.default = {
      # List of extensions available here: https://nur.nix-community.org/repos/rycee/.
      # TODO: Add https://typefully.com/minimal-twitter.
      # TODO: Add https://addons.mozilla.org/en-US/firefox/addon/get-rss-feed-url/.
      # TODO: Add https://www.fakespot.com/.
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bukubrow
        canvasblocker
        ublock-origin
        zotero-connector
      ];

      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "extensions.autoDisableScopes" = 0;
        "extensions.install_origins.enabled" = true;
        "gfx.canvas.accelerated" = true;
        "gfx.webrender.enabled" = true;
        "webgl.disabled" = false;
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    # See https://bugzilla.mozilla.org/show_bug.cgi?id=1898476 and https://gitlab.gnome.org/GNOME/mutter/-/issues/3504.
    MOZ_ENABLE_WAYLAND = 0; # Explicit-sync on wayland makes Firefox crash.
  };
}
