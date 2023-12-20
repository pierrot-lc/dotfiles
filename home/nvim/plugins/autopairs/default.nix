{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-autopairs;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
