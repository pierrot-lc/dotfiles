{
  pkgs,
  lib,
  config,
  ...
}: let
  accelerationParser = {
    "NVIDIA" = "cuda";
    "AMD" = "rocm";
  };

  ollamaPackage =
    if config.gpu == null
    then pkgs.ollama
    else (pkgs.ollama.override {acceleration = accelerationParser.${config.gpu};});
in {
  home.packages = [
    ollamaPackage
  ];
}
