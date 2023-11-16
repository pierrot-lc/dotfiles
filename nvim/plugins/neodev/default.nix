{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neodev-nvim;
      config = "require('neodev').setup()";
      type = "lua";
    }
  ];
}
