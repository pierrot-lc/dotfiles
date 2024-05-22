{lib, ...}: let
  validGPUs = ["NVIDIA" "AMD"];
in {
  options = {
    gpu = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum validGPUs);
      default = null;
      description = "What GPU acceleration are you using.";
    };
  };
}
