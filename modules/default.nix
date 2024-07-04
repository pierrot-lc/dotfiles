{lib, ...}: {
  imports = [
    ./theme.nix
  ];

  options = {
    accounts.enable = lib.mkEnableOption "Import accounts";
    arrs.enable = lib.mkEnableOption "Arrs services";
    docker.enable = lib.mkEnableOption "Enable Docker";
    gaming.enable = lib.mkEnableOption "Install game launchers and others";
    ollama.enable = lib.mkEnableOption "Enable Ollama";
    shellAliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Shell aliases to be added to the user profile.";
    };
  };
}
