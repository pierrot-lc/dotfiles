{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "NeogitOrg/neogit";
      config = "require('neogit').setup()";
      type = "lua";
    }

    # Dependencies
    plenary-nvim
    diffview-nvim
  ];
}
