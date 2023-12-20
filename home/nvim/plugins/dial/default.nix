{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = dial-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
