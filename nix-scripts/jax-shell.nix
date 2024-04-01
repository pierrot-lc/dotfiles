{
  description = "Jax devshell";

  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://ploop.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
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
        };

        python-packages = ps:
          with ps; [
            chex
            equinox
            jax
            jaxlib-bin
            jaxtyping
            numpy
            optax
          ];

        shell = pkgs.mkShell {
          name = "jax-dev";
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
