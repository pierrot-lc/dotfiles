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
            search = ["<Super>Space"];
            www = ["<Super>b"];
            custom-keybindings = ["/org/gnome/setting-daemon/plugins/media-keys/custom-keybindings/custom0/"];
          };
          "org/gnome/setting-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>Return";
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

            move-to-workspace-1 = ["<Shift><Super>a"];
            move-to-workspace-2 = ["<Shift><Super>z"];
            move-to-workspace-3 = ["<Shift><Super>e"];
            move-to-workspace-4 = ["<Shift><Super>r"];
            move-to-workspace-5 = ["<Shift><Super>t"];
            move-to-workspace-6 = ["<Shift><Super>y"];
            move-to-workspace-7 = ["<Shift><Super>u"];
            move-to-workspace-8 = ["<Shift><Super>i"];
            move-to-workspace-9 = ["<Shift><Super>o"];
            move-to-workspace-10 = ["<Shift><Super>p"];

            switch-to-workspace-1 = ["<Super>a"];
            switch-to-workspace-2 = ["<Super>z"];
            switch-to-workspace-3 = ["<Super>e"];
            switch-to-workspace-4 = ["<Super>r"];
            switch-to-workspace-5 = ["<Super>t"];
            switch-to-workspace-6 = ["<Super>y"];
            switch-to-workspace-7 = ["<Super>u"];
            switch-to-workspace-8 = ["<Super>i"];
            switch-to-workspace-9 = ["<Super>o"];
            switch-to-workspace-10 = ["<Super>p"];

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
