{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "hrsh7th/nvim-cmp";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    nvim-lspconfig
    (fromGitHub "hrsh7th/cmp-nvim-lsp")
    (fromGitHub "hrsh7th/cmp-nvim-lsp-signature-help")
    (fromGitHub "hrsh7th/cmp-path")
    (fromGitHub "hrsh7th/cmp-calc")
    (fromGitHub "lukas-reineke/cmp-rg")
    (fromGitHub "Dynge/gitmoji.nvim")
  ];

  programs.neovim.extraPackages = with pkgs; [
    ripgrep  # For `cmp-rg`.
  ];
}
