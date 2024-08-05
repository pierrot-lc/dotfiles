{
  pkgs,
  lib,
  config,
  ...
}: let
  layouts-to-string = file: let
    content = builtins.readFile file;
  in
    builtins.replaceStrings ["\n"] [""] content;
in {
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      {package = blur-my-shell;}
      {package = caffeine;}
      {package = just-perfection;}
      {package = runcat;}
      {package = tiling-shell;}
      {package = vitals;}
      {package = weather-oclock;}
    ];
  };

  # Use `dconf dump / > dconf.toml` to see the list of modified parameters in
  # your system.
  dconf.settings = {
    # Gnome inner workings.
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    # Keybindings.
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
      switch-to-workspace-left = ["<Super>h"];
      switch-to-workspace-right = ["<Super>l"];
      switch-windows = ["<Alt>space"];
      switch-windows-backward = ["<Shift><Alt>space"];
    };
    "org/gnome/mutter/keybindings" = {
      switch-monitor = ["XF86Display"]; # Disable the "<Super>p" shortcut, but keep the original special key.
    };

    # Extensions.
    "org/gnome/shell/extensions/tilingshell" = {
      layouts-json = layouts-to-string ./layouts.json;
    };
    "org/gnome/shell/extensions/caffeine" = {
      show-notifications = false;
      restore-state = true;
    };
    "org/gnome/shell/extensions/runcat" = {
      displaying-items = "character-and-percentage";
      idle-threshold = 15;
    };
    "org/gnome/shell/extensions/vitals" = {
      hot-sensors =
        (lib.optionals config.hardware.hasGPU [
          "_gpu#1_utilization_"
          "_gpu#1_memory_used_"
        ])
        ++ [
          "_memory_allocated_"
          "_storage_used_"
        ];
    };
  };
}
