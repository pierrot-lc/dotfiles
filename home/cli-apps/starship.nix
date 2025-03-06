{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      directory.truncate_to_repo = false;
      time.disabled = false;
      nix_shell = {
        format = "via [$symbol(\($name\))]($style) ";
        symbol = " ";
      };
    };
  };
}
