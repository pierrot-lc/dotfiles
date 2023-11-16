{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      config = "require('gitsigns').setup()";
      type = "lua";
    }
  ];
}
