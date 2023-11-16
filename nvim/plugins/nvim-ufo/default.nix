{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-ufo;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
