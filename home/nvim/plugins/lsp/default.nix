{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lspconfig;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
    lsp_signature-nvim
    {
      plugin = fidget-nvim;
      config = ''
        require("fidget").setup({
          -- window = { blend = 0 },
        })
      '';
      type = "lua";
    }
  ];

  programs.neovim.extraPackages = with pkgs; [
    # Language servers.
    ltex-ls
    lua-language-server
    marksman
    nil
    nixd
    nodePackages_latest.bash-language-server
    python311Packages.python-lsp-server
    ruff-lsp
  ];
}
