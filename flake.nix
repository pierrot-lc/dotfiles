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
    nvim-nix = {
      url = "github:pierrot-lc/nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My Librewolf derivation.
    librewolf-nix = {
      url = "github:pierrot-lc/librewolf-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Some private informations.
    private = {
      url = "git+ssh://git@github.com/pierrot-lc/dotfiles-private.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra packages.
    # ...
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    lib = nixpkgs.lib;
    hosts = {
      "t15" = {
        system = "x86_64-linux";
        options = ./hosts/t15/options.nix;
        nixosConf = ./hosts/t15/configuration.nix;
        hmModules = [./home/cli-apps ./home/dekstops ./home/gui-apps ./home/services ./home/shells];
      };
      "tiny-tower" = {
        system = "x86_64-linux";
        options = ./hosts/tiny-tower/options.nix;
        nixosConf = ./hosts/tiny-tower/configuration.nix;
        hmModules = [./home/cli-apps ./home/dekstops ./home/gui-apps ./home/services ./home/shells];
      };
      "x250" = {
        system = "x86_64-linux";
        options = ./hosts/x250/options.nix;
        nixosConf = ./hosts/x250/configuration.nix;
        hmModules = [./home/cli-apps ./home/dekstops ./home/gui-apps ./home/services ./home/shells];
      };
    };
  in {
    # Build the NixOS configurations for each hosts that have `nixConf` defined
    # in its attribute set.
    nixosConfigurations =
      lib.attrsets.concatMapAttrs (host: {
        system,
        nixosConf,
        options,
        ...
      }: {
        ${host} = lib.nixosSystem {
          inherit system;
          specialArgs = {
            private = inputs.private;
          };

          modules = [
            ./configuration
            ./options
            inputs.private.secrets
            nixosConf
            options
          ];
        };
      })
      (lib.attrsets.filterAttrs (n: v: v ? nixosConf) hosts);

    homeConfigurations =
      lib.attrsets.concatMapAttrs (host: {
        system,
        options,
        hmModules,
        ...
      }: {
        "pierrot-lc@${host}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [];
          };
          extraSpecialArgs = {
            username = "pierrot-lc";
            private = inputs.private;
          };

          modules =
            [
              ./home
              ./options
              inputs.librewolf-nix.hmModules.${system}.default
              inputs.nix-index-database.hmModules.nix-index
              inputs.nvim-nix.hmModules.${system}.default
              options
            ]
            ++ hmModules;
        };
      })
      (lib.attrsets.filterAttrs (n: v: v ? hmModules) hosts);
  };
}
