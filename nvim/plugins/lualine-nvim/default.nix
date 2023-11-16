{ config, pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lualine-nvim;
      config = ''
        require("lualine").setup({
          options = {
            theme = "nordic";
          }
        })
      '';
      type = "lua";
    }

    # Dependencies.
    nvim-web-devicons
  ];
}
