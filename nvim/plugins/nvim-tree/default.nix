{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-tree-lua;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies
    nvim-web-devicons
  ];
}
