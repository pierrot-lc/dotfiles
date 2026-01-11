{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (builtins.elem config.desktop.name ["GNOME" "Hyprland"]) {
    # Hint electron apps to use Wayland.
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };

  imports = [
    ./gnome
    ./hyprland
  ];
}
