{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = copilot-lua;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
