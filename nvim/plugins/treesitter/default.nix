{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withAllGrammars;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Extensions used above.
    nvim-treesitter-refactor
    nvim-treesitter-textobjects
    hmts-nvim
  ];
}
