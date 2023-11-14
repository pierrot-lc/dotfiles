{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "AlexvZyl/nordic.nvim";
      config = ''require("nordic").load()'';
      type = "lua";
    }
  ];
}
