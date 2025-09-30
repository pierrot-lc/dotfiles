{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "Hyprland") {
    # Enable Hyprland.
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;

    services.displayManager.gdm.enable = true;
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "pierrot-lc";
  };
}
