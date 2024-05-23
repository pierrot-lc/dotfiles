{
  description = "Pierrot's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      # GPU related stuff.
      "https://cuda-maintainers.cachix.org"
      "https://ploop.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "ploop.cachix.org-1:i6+Fqarsbf5swqH09RXOEDvxy7Wm7vbiIXu4A9HCg1g="
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
    };
  in {
    nixosConfigurations = {
      x250 = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./hosts/x250/configuration.nix
        ];
      };
      big-tower = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./hosts/big-tower/configuration.nix
        ];
      };
      t15 = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./hosts/t15/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "pierrot-lc@t15" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrot-lc";
        };

        modules = [
          ./home
          ./modules
          ./hosts/t15/options.nix
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };

      "pierrot-lc@x250" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrot-lc";
        };

        modules = [
          ./home
          ./modules
          ./hosts/x250/options.nix
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };

      "pierrot-lc@big-tower" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrot-lc";
        };

        modules = [
          ./home
          ./modules
          ./hosts/big-tower/options.nix
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };
    };
  };
}
