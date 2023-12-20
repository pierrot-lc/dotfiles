{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = data-viewer-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies
    plenary-nvim
    sqlite-lua
  ];

  programs.neovim.extraPackages = with pkgs; [
    sqlite
  ];
}
