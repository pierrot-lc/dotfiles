{
  description = "Python devshell";

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
        };

        python-packages = ps:
          with ps; [
            pip
            setuptools
            virtualenv
          ];

        fhs = pkgs.buildFHSUserEnv {
          name = "python-dev";
          targetPkgs = pkgs: (with pkgs; [
            (python312.withPackages python-packages)
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
