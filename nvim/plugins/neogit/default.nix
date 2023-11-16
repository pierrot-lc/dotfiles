{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neogit;
      config = "require('neogit').setup()";
      type = "lua";
    }

    # Dependencies
    plenary-nvim
    diffview-nvim
  ];
}
