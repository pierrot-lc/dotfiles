{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lint;
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
