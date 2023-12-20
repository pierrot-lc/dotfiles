{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-spider;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
