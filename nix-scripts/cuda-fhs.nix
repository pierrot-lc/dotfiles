{
  description = "CUDA devshell";

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
            pip
            setuptools
            virtualenv
          ];

        fhs = pkgs.buildFHSUserEnv {
          name = "cuda-dev";
          targetPkgs = pkgs: (with pkgs; [
            (python312.withPackages python-packages)
            cudaPackages.cudatoolkit
            cudaPackages.cudnn
            just
            pdm
            zlib # Numpy dep.
          ]);
        };
      in {
        devShells.default = fhs.env;
      }
    );
}
