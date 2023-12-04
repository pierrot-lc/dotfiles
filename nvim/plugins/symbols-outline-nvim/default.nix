{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = symbols-outline-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
