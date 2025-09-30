{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ./hyprland.conf;
    };

    programs.hyprlock = {
      enable = true;
      extraConfig = builtins.readFile ./hyprlock.conf;
    };
  };
}
