{ config, pkgs, lib, ... }:

let
  fromGitHub = import ../build-plugin.nix {inherit pkgs; inherit lib;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lspconfig;
      config = builtins.readFile ./config.lua;
      type = "lua";
    }

    (fromGitHub "ray-x/lsp_signature.nvim")

    # TODO: is it working? Maybe needs 'legacy' channel.
    {
      plugin = fromGitHub "j-hui/fidget.nvim";
      config = ''
        require("fidget").setup({
          -- window = { blend = 0 },
        })
      '';
      type = "lua";
    }
  ];

  programs.neovim.extraPackages = with pkgs; [
    # Language servers.
    ltex-ls
    lua-language-server
    marksman
    nodePackages_latest.bash-language-server
    python311Packages.python-lsp-server
    ruff-lsp
  ];
}
