{lib, ...}: {
  options = {
    desktop.name = lib.mkOption {
      type = lib.types.enum [
        "GNOME"
        "Hyprland"
        "none"
      ];
      default = "none";
      description = "Desktop environment to use.";
    };
  };
}
