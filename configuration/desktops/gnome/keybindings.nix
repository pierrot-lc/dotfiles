{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/input-sources" = {
            xkb-options = ["compose:rwin" "terminate:ctrl_alt_bksp"];
          };
          "org/gnome/settings-daemon/plugins/media-keys" = {
            calculator = ["<Super>c"];
            control-center = ["<Super>s"];
            home = ["<Super>f"];
            search = ["<Super>space"];
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
          "org/gnome/desktop/wm/keybindings" = {
            maximize = ["<Super>k"];
            unmaximize = ["<Super>j"];
            minimize = ["disabled"];
            move-to-monitor-left = ["<Shift><Super>h"];
            move-to-monitor-right = ["<Shift><Super>l"];
            move-to-workspace-1 = ["<Shift><Super>y"];
            move-to-workspace-2 = ["<Shift><Super>u"];
            move-to-workspace-3 = ["<Shift><Super>i"];
            move-to-workspace-4 = ["<Shift><Super>o"];
            switch-to-workspace-1 = ["<Super>y"];
            switch-to-workspace-2 = ["<Super>u"];
            switch-to-workspace-3 = ["<Super>i"];
            switch-to-workspace-4 = ["<Super>o"];
            switch-to-workspace-left = ["disabled"];
            switch-to-workspace-right = ["disabled"];
            switch-windows = ["<Alt>Space" "<Alt>Tab"];
            switch-windows-backward = ["<Shift><Alt>Space" "<Shift><Alt>Tab"];
          };
          "org/gnome/mutter/keybindings" = {
            switch-monitor = ["XF86Display"]; # Disable the "<Super>p" shortcut, but keep the original special key.
            toggle-tiled-left = ["<Super>h"];
            toggle-tiled-right = ["<Super>l"];
          };
        };
      }
    ];
  };
}
