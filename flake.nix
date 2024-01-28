{
  description = "Pierrot's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim dependencies.
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-nix = {
      url = "github:pierrot-lc/nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          inputs.nvim-nix.overlays.default
          inputs.neovim-nightly.overlay
        ];
      };
    in
    {
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
          };

          modules = [
            ./home
            ./home/accounts
          ];
        };

        pierrep = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            username = "pierrep";
          };

          modules = [
            ./home
            ./home/fonts.nix
          ];
        };
      };
    };
}
