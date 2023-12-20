{ config, pkgs, lib, ... }:

let
  pythonWithDebugpy = pkgs.python311.withPackages (ps: with ps; [ debugpy ]);
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-dap;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    {
      plugin = nvim-dap-python;
      config = "require('dap-python').setup('${pythonWithDebugpy}/bin/python')";
      type = "lua";
    }

    {
      plugin = nvim-dap-virtual-text;
      config = "require('nvim-dap-virtual-text').setup()";
      type = "lua";
    }

    nvim-dap-ui
  ];

  programs.neovim.extraPackages = with pkgs; [
    pythonWithDebugpy
  ];
}
