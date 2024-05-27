{config, ...}: {
  # Enable ollama service (avoid the need of using `ollama serve`). The
  # acceleration is automatically detected if `nix.config.cudaSupport` or
  # `nix.config.rocmSupport` is set to `true`.
  services.ollama = {
    inherit (config.ollama) enable;
  };
}
