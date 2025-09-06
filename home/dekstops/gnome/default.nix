{
  pkgs,
  lib,
  config,
  ...
}: let
  themeParser = {
    "catppuccin-macchiato" = {
      "dark" = "blue";
      "light" = "slate";
    };
    "catppuccin-mocha" = {
      "dark" = "purple";
      "light" = "blue";
    };
    "gruvbox" = {
      "dark" = "orange";
      "light" = "yellow";
    };
    "melange" = {
      "dark" = "yellow";
      "light" = "teal";
    };
    "rose-pine" = {
      "dark" = "purple";
      "light" = "red";
    };
  };

  colorScheme = {
    "dark" = "prefer-dark";
    "light" = "default";
  };
in {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    programs.gnome-shell = {
      enable = true;
      extensions = with pkgs.gnomeExtensions; [
        {package = blur-my-shell;}
        {package = caffeine;}
        {package = just-perfection;}
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
      "org/gnome/desktop/interface" = {
        accent-color = themeParser.${config.theme.name}.${config.theme.flavour};
        color-scheme = colorScheme.${config.theme.flavour};
      };
      "org/gnome/TextEditor" = {
        restore-session = false;
      };

      # Shell layout.
      "org/gnome/shell" = {
        favorite-apps = [
          "kitty.desktop"
          "librewolf.desktop"
          "io.gitlab.news_flash.NewsFlash.desktop"
          "io.github.alainm23.planify.desktop"
          "thunderbird.desktop"
          "org.gnome.Nautilus.desktop"
        ];
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
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        edge-tiling = false;
      };
      "org/gnome/mutter/keybindings" = {
        switch-monitor = ["XF86Display"]; # Disable the "<Super>p" shortcut, but keep the original special key.
        toggle-tiled-left = ["<Super>h"];
        toggle-tiled-right = ["<Super>l"];
      };

      # Extensions.
      "org/gnome/shell/extensions/just-perfection" = {
        animation = 3;
        workspace = true;
        workspace-popup = false;
        workspace-switcher-should-show = true;
        workspaces-in-app-grid = true;
      };
      "org/gnome/shell/extensions/caffeine" = {
        show-notifications = false;
        restore-state = true;
      };
      "org/gnome/shell/extensions/vitals" = {
        hot-sensors =
          ["_processor_usage_"]
          ++ (lib.optionals config.hardware.hasGPU ["_gpu#1_utilization_" "_gpu#1_memory_used_"])
          ++ ["_memory_allocated_" "_storage_used_"];
        show-gpu = config.hardware.hasGPU;
      };
    };
  };
}
