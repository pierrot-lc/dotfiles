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
  };
}
