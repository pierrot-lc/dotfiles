{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "nvim-neorg/neorg";
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies.
    plenary-nvim
    nvim-treesitter
    zen-mode-nvim
    nvim-cmp
  ];
}
