{lib, ...}: {
  imports = [
    ./desktop.nix
    ./theme.nix
  ];

  options = {
    arrs.enable = lib.mkEnableOption "Arrs services";
    gaming.enable = lib.mkEnableOption "Install game launchers and others";
    hardware.hasGPU = lib.mkEnableOption "Add some GPU-related options";
    ollama.enable = lib.mkEnableOption "Enable Ollama";
    virtual-machines.enable = lib.mkEnableOption "Enable virtualisation"; # NOTE: `virtualisation` is already taken.
    raspi-4.ip4 = lib.mkOption {
      type = lib.types.str;
      default = "192.168.1.95";
      description = "IPv4 address of the rasberry-pi 4";
    };
  };
}
