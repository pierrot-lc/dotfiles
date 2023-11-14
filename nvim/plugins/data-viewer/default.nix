{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "VidocqH/data-viewer.nvim";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies
    plenary-nvim
    sqlite-lua
  ];

  programs.neovim.extraPackages = with pkgs; [
    sqlite
  ];
}
