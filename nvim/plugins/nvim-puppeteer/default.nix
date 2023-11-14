{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    (fromGitHub "chrisgrieser/nvim-puppeteer")

    # Dependencies.
    nvim-treesitter
  ];
}
