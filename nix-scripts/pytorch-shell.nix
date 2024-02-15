{
  pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  }
}:
let
  python-packages = ps: with ps; [
    pip
    setuptools
    virtualenv

    beartype
    einops
    gymnasium
    hydra-core
    jaxtyping
    numpy
    pytest
    torch
    torchinfo
    torchrl  # Does not exists on 23.11.
    tqdm
    wandb
  ];

  fhs = pkgs.buildFHSUserEnv {
    name = "pytorch";
    targetPkgs = pkgs: (with pkgs; [
      (python311.withPackages python-packages)
      cudaPackages.cudatoolkit
      cudaPackages.cudnn
    ]);
    runScript = "bash";
  };
in
  fhs.env
