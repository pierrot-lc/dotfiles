{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    just-perfection
    runcat
    vitals
    weather-oclock
  ];

  dconf.settings = {
    # Gnome inner workings.
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    # Keybindings.
    "org/gnome/settings-daemon/plugins/media-keys" = {
      calculator = ["<Super>c"];
      control-center = ["<Super>s"];
      home = ["<Super>f"];
      search = ["<Super>l"];
      www = ["<Super>b"];
      custom-keybindings = [
        "/org/gnome/setting-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/setting-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "kitty";
      name = "Launch terminal";
    };
    "org/gnome/shell/keybindings" = {
      toggle-message-tray = ["<Super>m"];
      toggle-quick-settings = ["disabled"];
    };

    # Extensions.
    "org/gnome/shell/extensions/caffeine" = {
      show-notifications = false;
      restore-state = true;
    };
    "org/gnome/shell/extensions/runcat" = {
      displaying-items = "character-and-percentage";
      idle-threshold = 15;
    };
    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = ["_storage_used_"];
    };
  };
}
