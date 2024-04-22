{lib, ...}: {
  options = {
    shellAliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Shell aliases to be added to the user profile.";
    };
  };
}
