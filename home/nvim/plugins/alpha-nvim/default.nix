{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = alpha-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
