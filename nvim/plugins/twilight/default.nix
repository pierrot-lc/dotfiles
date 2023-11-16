{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = twilight-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
