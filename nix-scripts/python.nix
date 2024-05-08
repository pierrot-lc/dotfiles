{pkgs ? import <nixpkgs> {}}: let
  python-packages = ps:
    with ps; [
      pip
      setuptools
      virtualenv
    ];

  targetPkgs = ps: (with ps; [
    (pthon311.withPackages python-packages)
    pdm
    zlib # Numpy dep.
  ]);

  fhs = pkgs.buildFHSUserEnv {
    name = "python";
    targetPkgs = targetPkgs;
  };
in
  fhs.env
