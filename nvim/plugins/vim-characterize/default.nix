{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Shows more information when using the "ga" keybinding.
    vim-characterize
  ];
}
