{
  pkgs,
  theme,
  ...
}: {
  nvim-nix = {
    enable = true;
    transparentBackground = true;
    inherit theme;
  };

  # Add some LSPs and formatters. Others (such as pylsp or ruff-lsp)
  # should be installed per-project in its flake declaration.
  home.packages = with pkgs; [
    alejandra
    just
    lua-language-server
    marksman
    nil
    nodePackages_latest.bash-language-server
    python311Packages.python-lsp-server
    ruff-lsp
    shfmt
    stylua
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
