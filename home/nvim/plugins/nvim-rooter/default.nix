{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-rooter-lua;
      config = "require('nvim-rooter').setup({ manual = true })";
      type = "lua";
    }
  ];
}
