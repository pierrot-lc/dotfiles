{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.networking.hostName == "t15") {
    gpu = "NVIDIA";
  };
}
