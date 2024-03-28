{pkgs, ...}: {
  home.packages = with pkgs; [
    nvim-pkg
  ];

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
