{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.networking.hostName == "big-tower") {
    gpu = "NVIDIA";
  };
}
