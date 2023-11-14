{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "notjedi/nvim-rooter.lua";
      config = "require('nvim-rooter').setup({ manual = true })";
      type = "lua";
    }
  ];
}
