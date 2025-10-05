{
  pkgs,
  lib,
  config,
  ...
}: let
  extensions = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    just-perfection
    vitals
    weather-oclock
  ];
in {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    environment.systemPackages = extensions;

    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/shell".enabled-extensions = map (e: e.extensionUuid) extensions;
          "org/gnome/shell/extensions/just-perfection" = {
            animation = lib.gvariant.mkInt32 3;
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
      }
    ];
  };
}
