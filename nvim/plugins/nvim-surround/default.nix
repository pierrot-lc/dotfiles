{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-surround;
      config = "require('nvim-surround').setup({})";
      type = "lua";
    }
  ];
}
