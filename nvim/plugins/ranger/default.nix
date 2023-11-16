{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = ranger-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];

  programs.neovim.extraPackages = with pkgs; [
      ranger
  ];
}
