{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "stevearc/conform.nvim";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }
  ];

  programs.neovim.extraPackages = with pkgs; [
    black
    isort
    jq
    perl538Packages.LatexIndent
    shfmt
    stylua
  ];
}
