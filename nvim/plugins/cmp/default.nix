{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-cmp;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    nvim-lspconfig
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp-path
    cmp-calc
    cmp-rg
    gitmoji-nvim
  ];

  programs.neovim.extraPackages = with pkgs; [
    ripgrep # For `cmp-rg`.
  ];
}
