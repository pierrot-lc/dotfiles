{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "Hyprland") {
    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland = {
      extraConfig = builtins.readFile ./hyprland.conf;
    };
  };
}
