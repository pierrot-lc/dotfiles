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
          theme = "catppuccin";
        };

        modules = [
          ./home
          ./modules
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };
    };
  };
}
