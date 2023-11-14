{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "mfussenegger/nvim-lint";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];

  programs.neovim.extraPackages = with pkgs; [
      nodePackages_latest.markdownlint-cli
      proselint
      shellcheck
      yamllint
  ];
}
