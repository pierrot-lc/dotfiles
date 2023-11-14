{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neodev-nvim;
      config = "require('neodev').setup()";
      type = "lua";
    }
  ];
}
