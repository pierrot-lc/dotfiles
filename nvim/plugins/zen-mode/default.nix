{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = zen-mode-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
