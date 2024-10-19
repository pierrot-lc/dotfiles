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

    # Weekly updated nix-index database.
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My Neovim derivation.
    nvim-nix.url = "github:pierrot-lc/nvim-nix";

    # My Librewolf derivation.
    librewolf-nix = {
      url = "github:pierrot-lc/librewolf-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Some private informations.
    private = {
      url = "git+ssh://git@github.com/pierrot-lc/dotfiles-private";
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
        inputs.librewolf-nix.overlays.default
      ];
    };

    # Mappings of specific configurations for each hosts. It is used in
    # `concatMapAttrs` which needs an attribute set to work so we add dumb
    # values.
    hosts = {
      "big-tower" = null;
      "t15" = null;
      "x250" = null;
    };
    nixosConfigurationsParser = {
      "big-tower" = ./hosts/big-tower/configuration.nix;
      "t15" = ./hosts/t15/configuration.nix;
      "x250" = ./hosts/x250/configuration.nix;
    };
    optionsParser = {
      "big-tower" = ./hosts/big-tower/options.nix;
      "t15" = ./hosts/t15/options.nix;
      "x250" = ./hosts/x250/options.nix;
    };
  in {
    nixosConfigurations =
      lib.attrsets.concatMapAttrs (host: _: {
        ${host} = lib.nixosSystem {
          inherit system;
          specialArgs = {
            private = inputs.private;
          };

          modules = [
            ./configuration
            ./options
            inputs.private.secrets
            nixosConfigurationsParser.${host}
            optionsParser.${host}
          ];
        };
      })
      hosts;

    homeConfigurations =
      lib.attrsets.concatMapAttrs (host: _: {
        "pierrot-lc@${host}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            username = "pierrot-lc";
            private = inputs.private;
          };

          modules = [
            ./home
            ./options
            inputs.nvim-nix.nixosModules.${system}.default
            inputs.nix-index-database.hmModules.nix-index
            optionsParser.${host}
          ];
        };
      })
      hosts;
  };
}
