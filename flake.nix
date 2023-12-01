{
  description = "Pierrot's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vimPlugins = {
      url = "./nvim";
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
          # Provides neovim nightly.
          inputs.neovim-nightly-overlay.overlay
          # Provides missing neovim plugins.
          inputs.vimPlugins.packages.${system}.vimPlugins
        ];
      };
    in
    {
      nixosConfigurations = {
        x250 = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./gnome.nix
            ./hardwares/x250
          ];
        };
        big-tower = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./gnome.nix
            ./hardwares/big-tower
          ];
        };
        t15 = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./gnome.nix
            ./hardwares/t15
          ];
        };
      };

      homeConfigurations = {
        pierrot-lc = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # extraSpecialArgs = { inherit inputs; };

          modules = [
            ./home.nix
          ];
        };
      };
    };
}
