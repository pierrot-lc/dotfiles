{
  pkgs,
  config,
  ...
}: {
  nvim-nix = {
    enable = true;
    version = "nightly";
    inherit (config) theme;
    extraLuaConfig = /* lua */ ''
      -- Prevent nix from changing the builtin shell when being in a `nix develop` session.
      -- See https://github.com/NixOS/nix/issues/12008.
      vim.opt.shell = "/run/current-system/sw/bin/bash"
    '';
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
    ty
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
