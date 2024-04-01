{
  description = "PyTorch devshell";

  # To avoid compiling the `torch` package, `einops` and other cuda
  # intensive package, you have to use the cachix from the
  # cuda-maintainers.
  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://nix-community.cachix.org"
      "https://ploop.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ploop.cachix.org-1:i6+Fqarsbf5swqH09RXOEDvxy7Wm7vbiIXu4A9HCg1g="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    systems = ["x86_64-linux"];
  in
    flake-utils.lib.eachSystem systems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            cudaSupport = true;
          };

          # Override all torch packages for `torch-bin`.
          # This is important since the other torch derivatives
          # need a default torch package and assume it's `torch`.

          # However, this is not necessary. By setting `cudaSupport = true`,
          # the `torch` package and its derivatives will be built with cuda
          # support automatically. It makes things easier.

          # Taken from: https://discourse.nixos.org/t/overriding-torch-with-torch-bin-for-all-packages/37086/2.
          # overlays = [
          #   (final: prev: {
          #     pythonPackagesExtensions = [
          #       (py-final: py-prev: {
          #         torch = py-final.torch-bin;
          #       })
          #     ];
          #   })
          # ];
        };

        python-packages = ps:
          with ps; [
            beartype
            einops
            gymnasium
            hydra-core
            jaxtyping
            numpy
            pytest
            torch
            torchinfo
            torchrl
            tqdm
            wandb
          ];

        shell = pkgs.mkShell {
          name = "pytorch-dev";
          packages = with pkgs; [
            (python311.withPackages python-packages)
            cudaPackages.cudatoolkit
            cudaPackages.cudnn
            just
          ];
        };
      in {
        devShells.default = shell;
      }
    );
}
