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

    # Mappings of specific configurations for each hosts.
    nixosConfigurationsParser = {
      "big-tower" = ./hosts/big-tower/configuration.nix;
      "t15" = ./hosts/t15/configuration.nix;
      "x250" = ./hosts/x250/configuration.nix;
    };
    homeConfigurationsParser = {
      "big-tower" = ./hosts/big-tower/options.nix;
      "t15" = ./hosts/t15/options.nix;
      "x250" = ./hosts/x250/options.nix;
    };
  in {
    nixosConfigurations = lib.attrsets.concatMapAttrs (host: configurationFile: {
      ${host} = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          configurationFile
        ];
      };
    }) nixosConfigurationsParser;

    homeConfigurations = lib.attrsets.concatMapAttrs (host: optionsFile: {
      "pierrot-lc@${host}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = "pierrot-lc";
        };

        modules = [
          ./home
          ./modules
          optionsFile
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };
    }) homeConfigurationsParser;
  };
}
