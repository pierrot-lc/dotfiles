{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = toggleterm-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
