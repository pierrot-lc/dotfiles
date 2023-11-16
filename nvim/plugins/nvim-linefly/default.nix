{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-linefly;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies
    nvim-web-devicons
  ];
}
