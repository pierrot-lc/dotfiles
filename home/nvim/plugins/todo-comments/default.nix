{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = todo-comments-nvim;
      config = "require('todo-comments').setup()";
      type = "lua";
    }

    # Dependencies.
    telescope-nvim
    plenary-nvim
  ];

  programs.neovim.extraPackages = with pkgs; [
      ripgrep
  ];
}
