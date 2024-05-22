{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.networking.hostName == "x250") {
    gpu = null;
  };
}
