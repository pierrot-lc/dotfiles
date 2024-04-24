{
  description = "Pierrot's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim dependencies.
    nvim-nix.url = "github:pierrot-lc/nvim-nix";
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [
        inputs.neovim-nightly.overlay
      ];
    };
  in {
    nixosConfigurations = {
      x250 = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./configuration/hardwares/x250
        ];
      };
      big-tower = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./configuration/hardwares/big-tower
        ];
      };
      t15 = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./configuration/hardwares/t15
        ];
      };
    };

    homeConfigurations = {
      pierrot-lc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrot-lc";
          theme = "gruvbox";
        };

        modules = [
          ./home
          ./home/accounts
          ./modules
          inputs.nvim-nix.nixosModules.default
        ];
      };

      pierrep = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrep";
          theme = "kanagawa";
        };

        modules = [
          ./home
          ./modules
          inputs.nvim-nix.nixosModules.default
        ];
      };
    };
  };
}
