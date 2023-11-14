{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withAllGrammars;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Extensions used above.
    nvim-treesitter-refactor
    nvim-treesitter-textobjects
    (fromGitHub "calops/hmts.nvim")
  ];
}
