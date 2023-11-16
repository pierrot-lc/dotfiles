{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nordic-nvim;
      config = "require('nordic').load()";
      type = "lua";
    }
  ];
}
