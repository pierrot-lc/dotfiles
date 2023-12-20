{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = leap-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
