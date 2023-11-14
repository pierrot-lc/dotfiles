{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Shows more information when using the "ga" keybinding.
    (fromGitHub "tpope/vim-characterize")
  ];
}
