{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = which-key-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
