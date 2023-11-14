{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = fromGitHub "ziontee113/icon-picker.nvim";
      config = "require('icon-picker').setup({ disable_legacy_commands = true })";
      type = "lua";
    }
  ];
}
