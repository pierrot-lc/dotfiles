{theme, ...}: {
  nvim-nix = {
    enable = true;
    inherit theme;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bash.shellAliases = {
    bim = "nvim";
    cim = "nvim";
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };
}
