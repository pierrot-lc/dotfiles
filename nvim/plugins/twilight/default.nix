{ config, pkgs, lib, ... }:

let
  fromgithub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimplugins; [
    {
      plugin = fromgithub "folke/twilight.nvim";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];
}
