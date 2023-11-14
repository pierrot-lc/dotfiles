{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "chrisgrieser/nvim-spider";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
