{
  description = "Build all my Neovim plugins";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    alpha-nvim = {
      url = "github:goolord/alpha-nvim";
      flake = false;
    };
    copilot-lua = {
      url = "github:zbirenbaum/copilot.lua";
      flake = false;
    };
    conform-nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp-calc = {
      url = "github:hrsh7th/cmp-calc";
      flake = false;
    };
    cmp-rg = {
      url = "github:lukas-reineke/cmp-rg";
      flake = false;
    };
    data-viewer-nvim = {
      url = "github:VidocqH/data-viewer.nvim";
      flake = false;
    };
    dial-nvim = {
      url = "github:monaqa/dial.nvim";
      flake = false;
    };
    fidget-nvim = {
      url = "github:j-hui/fidget.nvim";
      flake = false;
    };
    gitmoji-nvim = {
      url = "github:Dynge/gitmoji.nvim";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    hmts-nvim = {
      url = "github:calops/hmts.nvim";
      flake = false;
    };
    icon-picker-nvim = {
      url = "github:ziontee113/icon-picker.nvim";
      flake = false;
    };
    leap-nvim = {
      url = "github:ggandor/leap.nvim";
      flake = false;
    };
    lsp_signature-nvim = {
      url = "github:ray-x/lsp_signature.nvim";
      flake = false;
    };
    lualine-nvim = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };
    neogit = {
      url = "github:NeogitOrg/neogit";
      flake = false;
    };
    neorg = {
      url = "github:nvim-neorg/neorg";
      flake = false;
    };
    nordic-nvim = {
      url = "github:AlexvZyl/nordic.nvim";
      flake = false;
    };
    nvim-autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    nvim-dap-ui = {
      url = "github:rcarriga/nvim-dap-ui";
      flake = false;
    };
    nvim-dap-virtual-text = {
      url = "github:thehamsta/nvim-dap-virtual-text";
      flake = false;
    };
    nvim-lint = {
      url = "github:mfussenegger/nvim-lint";
      flake = false;
    };
    nvim-puppeteer = {
      url = "github:chrisgrieser/nvim-puppeteer";
      flake = false;
    };
    nvim-rooter-lua = {
      url = "github:notjedi/nvim-rooter.lua";
      flake = false;
    };
    nvim-spider = {
      url = "github:chrisgrieser/nvim-spider";
      flake = false;
    };
    nvim-surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };
    outline-nvim = {
      url = "github:hedyhli/outline.nvim";
      flake = false;
    };
    ranger-nvim = {
      url = "github:kelly-lin/ranger.nvim";
      flake = false;
    };
    symbols-outline-nvim = {
      url = "github:simrat39/symbols-outline.nvim";
      flake = false;
    };
    telescope-repo-nvim = {
      url = "github:cljoly/telescope-repo.nvim";
      flake = false;
    };
    toggleterm-nvim = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };
    twilight-nvim = {
      url = "github:folke/twilight.nvim";
      flake = false;
    };
    vim-characterize = {
      url = "github:tpope/vim-characterize";
      flake = false;
    };
    vim-kitty = {
      url = "github:fladson/vim-kitty";
      flake = false;
    };
    vim-lastplace = {
      url = "github:farmergreg/vim-lastplace";
      flake = false;
    };
    zen-mode-nvim = {
      url = "github:folke/zen-mode.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages.${system}.vimPlugins = final: prev: {
        vimPlugins = prev.vimPlugins // {
          alpha-nvim = prev.vimUtils.buildVimPlugin {
            name = "alpha-nvim";
            src = inputs.alpha-nvim;
          };
          copilot-lua = prev.vimUtils.buildVimPlugin {
            name = "copilot-lua";
            src = inputs.copilot-lua;
          };
          conform-nvim = prev.vimUtils.buildVimPlugin {
            name = "conform-nvim";
            src = inputs.conform-nvim;
          };
          cmp-nvim-lsp = prev.vimUtils.buildVimPlugin {
            name = "cmp-nvim-lsp";
            src = inputs.cmp-nvim-lsp;
          };
          cmp-path = prev.vimUtils.buildVimPlugin {
            name = "cmp-path";
            src = inputs.cmp-path;
          };
          cmp-calc = prev.vimUtils.buildVimPlugin {
            name = "cmp-calc";
            src = inputs.cmp-calc;
          };
          cmp-rg = prev.vimUtils.buildVimPlugin {
            name = "cmp-rg";
            src = inputs.cmp-rg;
          };
          dial-nvim = prev.vimUtils.buildVimPlugin {
            name = "dial-nvim";
            src = inputs.dial-nvim;
          };
          data-viewer-nvim = prev.vimUtils.buildVimPlugin {
            name = "data-viewer-nvim";
            src = inputs.data-viewer-nvim;
          };
          fidget-nvim = prev.vimUtils.buildVimPlugin {
            name = "fidget-nvim";
            src = inputs.fidget-nvim;
          };
          gitmoji-nvim = prev.vimUtils.buildVimPlugin {
            name = "gitmoji-nvim";
            src = inputs.gitmoji-nvim;
          };
          gitsigns-nvim = prev.vimUtils.buildVimPlugin {
            name = "gitsigns-nvim";
            src = inputs.gitsigns-nvim;
          };
          hmts-nvim = prev.vimUtils.buildVimPlugin {
            name = "hmts-nvim";
            src = inputs.hmts-nvim;
          };
          icon-picker-nvim = prev.vimUtils.buildVimPlugin {
            name = "icon-picker-nvim";
            src = inputs.icon-picker-nvim;
          };
          leap-nvim = prev.vimUtils.buildVimPlugin {
            name = "leap-nvim";
            src = inputs.leap-nvim;
          };
          lsp_signature-nvim = prev.vimUtils.buildVimPlugin {
            name = "lsp_signature-nvim";
            src = inputs.lsp_signature-nvim;
          };
          lualine-nvim = prev.vimUtils.buildVimPlugin {
            name = "lualine-nvim";
            src = inputs.lualine-nvim;
          };
          neogit = prev.vimUtils.buildVimPlugin {
            name = "neogit";
            src = inputs.neogit;
          };
          neorg = prev.vimUtils.buildVimPlugin {
            name = "neorg";
            src = inputs.neorg;
          };
          nordic-nvim = prev.vimUtils.buildVimPlugin {
            name = "nordic-nvim";
            src = inputs.nordic-nvim;
          };
          nvim-autopairs = prev.vimUtils.buildVimPlugin {
            name = "nvim-autopairs";
            src = inputs.nvim-autopairs;
          };
          nvim-cmp = prev.vimUtils.buildVimPlugin {
            name = "nvim-cmp";
            src = inputs.nvim-cmp;
          };
          nvim-dap-ui = prev.vimUtils.buildVimPlugin {
            name = "nvim-dap-ui";
            src = inputs.nvim-dap-ui;
          };
          nvim-dap-virtual-text = prev.vimUtils.buildVimPlugin {
            name = "nvim-dap-virtual-text";
            src = inputs.nvim-dap-virtual-text;
          };
          nvim-lint = prev.vimUtils.buildVimPlugin {
            name = "nvim-lint";
            src = inputs.nvim-lint;
          };
          nvim-puppeteer = prev.vimUtils.buildVimPlugin {
            name = "nvim-puppeteer";
            src = inputs.nvim-puppeteer;
          };
          nvim-rooter-lua = prev.vimUtils.buildVimPlugin {
            name = "nvim-rooter-lua";
            src = inputs.nvim-rooter-lua;
          };
          nvim-spider = prev.vimUtils.buildVimPlugin {
            name = "nvim-spider";
            src = inputs.nvim-spider;
          };
          nvim-surround = prev.vimUtils.buildVimPlugin {
            name = "nvim-surround";
            src = inputs.nvim-surround;
          };
          outline-nvim = prev.vimUtils.buildVimPlugin {
            name = "outline-nvim";
            src = inputs.outline-nvim;
          };
          ranger-nvim = prev.vimUtils.buildVimPlugin {
            name = "ranger-nvim";
            src = inputs.ranger-nvim;
          };
          telescope-repo-nvim = prev.vimUtils.buildVimPlugin {
            name = "telescope-repo-nvim";
            src = inputs.telescope-repo-nvim;
          };
          toggleterm-nvim = prev.vimUtils.buildVimPlugin {
            name = "toggleterm-nvim";
            src = inputs.toggleterm-nvim;
          };
          twilight-nvim = prev.vimUtils.buildVimPlugin {
            name = "twilight-nvim";
            src = inputs.twilight-nvim;
          };
          vim-characterize = prev.vimUtils.buildVimPlugin {
            name = "vim-characterize";
            src = inputs.vim-characterize;
          };
          vim-kitty = prev.vimUtils.buildVimPlugin {
            name = "vim-kitty";
            src = inputs.vim-kitty;
          };
          vim-lastplace = prev.vimUtils.buildVimPlugin {
            name = "vim-lastplace";
            src = inputs.vim-lastplace;
          };
          zen-mode-nvim = prev.vimUtils.buildVimPlugin {
            name = "zen-mode-nvim";
            src = inputs.zen-mode-nvim;
          };
        };
      };
    };
}
