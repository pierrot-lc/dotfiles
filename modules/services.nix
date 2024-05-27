{lib, ...}: {
  options = {
    ollama.enable = lib.mkEnableOption "Enables Ollama";
  };
}
