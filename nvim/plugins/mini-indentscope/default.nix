{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = mini-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
