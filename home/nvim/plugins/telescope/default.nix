{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = telescope-nvim;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    # Dependencies.
    plenary-nvim
    telescope-fzf-native-nvim
    telescope-repo-nvim
  ];

  programs.neovim.extraPackages = with pkgs; [
    # Telescope dependencies.
    ripgrep

    # Telescope repo dependencies.
    bat
    fd
    glow
    mlocate
  ];
}
