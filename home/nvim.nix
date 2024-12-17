{
  pkgs,
  config,
  ...
}: {
  nvim-nix = {
    enable = true;
    version = "nightly";
    inherit (config) theme;
  };

  # Add some LSPs and formatters.
  home.packages = with pkgs; [
    alejandra
    basedpyright
    bash-language-server
    inotify-tools # https://github.com/neovim/neovim/pull/29374.
    just
    lua-language-server
    marksman
    nixd
    ruff
    shfmt
    stylua
    tinymist
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    bim = "nvim";
    cim = "nvim";
    ivm = "nvim";
    vi = "nvim";
    vim = "nvim";
    vmi = "nvim";
    vimdiff = "nvim -d";
  };
}
