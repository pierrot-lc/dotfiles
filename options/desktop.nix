{lib, ...}: {
  options = {
    desktop = {
      name = lib.mkOption{
        type = lib.types.enum [
          "GNOME"
          "none"
        ];
        default = "none";
        description = "Desktop environment to use.";
      };
    };
  };
}
