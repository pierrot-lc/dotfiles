{
  pkgs,
  config,
  ...
}: {
  nvim-nix = {
    enable = true;
    transparentBackground = false;
    inherit (config) theme;
  };

  # Add some LSPs and formatters. Others (such as pylsp or ruff-lsp)
  # should be installed per-project in its flake declaration.
  home.packages = with pkgs; [
    alejandra
    bash-language-server
    just
    lua-language-server
    marksman
    nixd
    python311Packages.python-lsp-server
    ruff
    shfmt
    stylua
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  shellAliases = {
    bim = "nvim";
    cim = "nvim";
    vi = "nvim";
    vim = "nvim";
    vmi = "nvim";
    vimdiff = "nvim -d";
  };
}
