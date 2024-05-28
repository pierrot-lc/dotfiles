{lib, ...}: {
  imports = [
    ./theme.nix
  ];

  options = {
    accounts.enable = lib.mkEnableOption "Import accounts";

    ollama.enable = lib.mkEnableOption "Enables Ollama";

    shellAliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Shell aliases to be added to the user profile.";
    };
  };
}
