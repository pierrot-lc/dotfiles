{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neorg;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies.
    plenary-nvim
    nvim-treesitter
    zen-mode-nvim
    nvim-cmp
  ];
}
