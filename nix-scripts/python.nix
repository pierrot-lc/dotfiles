{pkgs ? import <nixpkgs>}: let
  python-packages = ps:
    with ps; [
      pip
      setuptools
      virtualenv
    ];

  libs = with pkgs; [
    stdenv.cc.cc.lib
    zlib
  ];
in
  pkgs.mkShell {
    packages = [
      (pkgs.python312.withPackages python-packages)
      pkgs.uv
    ];

    env = {
      # Make the `libstdc++.so.6` and `zlib.so` available.
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
    };
  }
