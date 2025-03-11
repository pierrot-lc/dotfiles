{lib, ...}: {
  options = {
    desktop.enable = lib.mkEnableOption "Enable graphical session.";
    desktop.name = lib.mkOption {
      type = lib.types.enum [
        "GNOME"
        "none"
      ];
      default = "none";
      description = "Desktop environment to use.";
    };
  };

  config = {
    desktop.enable = lib.mkDefault true;
  };
}
