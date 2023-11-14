{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "lewis6991/gitsigns.nvim";
      config = "require('gitsigns').setup()";
      type = "lua";
    }
  ];
}
