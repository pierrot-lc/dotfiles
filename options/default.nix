{lib, ...}: {
  imports = [
    ./desktop.nix
    ./theme.nix
  ];

  options = {
    arrs.enable = lib.mkEnableOption "Arrs services";
    docker.enable = lib.mkEnableOption "Enable Docker";
    gaming.enable = lib.mkEnableOption "Install game launchers and others";
    hardware.hasGPU = lib.mkEnableOption "Add some GPU-related options";
    librewolf.enable = lib.mkEnableOption "Minimal set of packages only";
    mails.enable = lib.mkEnableOption "Setup mails and thunderbird";
    newsflash.enable = lib.mkEnableOption "Install Newsflash";
    ollama.enable = lib.mkEnableOption "Enable Ollama";
    planify.enable = lib.mkEnableOption "Install Planify";
    virtual-machines.enable = lib.mkEnableOption "Enable virtualisation"; # NOTE: `virtualisation` is already taken.
  };
}
