{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = icon-picker-nvim;
      config = "require('icon-picker').setup({ disable_legacy_commands = true })";
      type = "lua";
    }
  ];
}
