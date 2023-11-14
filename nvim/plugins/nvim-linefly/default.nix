{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "bluz71/nvim-linefly";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies
    nvim-web-devicons
  ];
}
