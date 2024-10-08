{
  pkgs,
  config,
  ...
}: {
  nvim-nix = {
    enable = true;
    transparentBackground = false;
    theme = config.theme.name;
  };

  # Add some LSPs and formatters.
  home.packages = with pkgs; [
    alejandra
    bash-language-server
    inotify-tools # https://github.com/neovim/neovim/pull/29374.
    just
    lua-language-server
    marksman
    nixd
    python311Packages.python-lsp-server
    ruff
    shfmt
    stylua
    tinymist
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  shellAliases = {
    bim = "nvim";
    cim = "nvim";
    ivm = "nvim";
    vi = "nvim";
    vim = "nvim";
    vmi = "nvim";
    vimdiff = "nvim -d";
  };
}
