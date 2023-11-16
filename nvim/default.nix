{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;
  };

  programs.neovim.extraLuaConfig = builtins.concatStringsSep "\n" [
    (builtins.readFile ./options.lua)
    (builtins.readFile ./commands.lua)
    (builtins.readFile ./keybindings.lua)
    ''
-- ========================================================================== --
-- ==                             PLUGINS                                  == --
-- ========================================================================== --
    ''
  ];

  # `nixpkgs` has a `programs.neovim.runtime` that is better suited for this.
  # But `home-manager` does not so we fall back to this `home.file` solution.
  # Ideally, the config path should not be hardcoded.
  home.file = {
    ".config/nvim/ftplugin".source = ./ftplugin;
  };

  imports = [
    ./plugins
  ];
}
