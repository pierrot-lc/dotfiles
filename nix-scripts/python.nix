{pkgs ? import <nixpkgs> {config.allowUnfree = true;}}: let
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
    buildInputs = [
      (pkgs.python311.withPackages python-packages)
      pkgs.uv
    ];

    # Make the `libstdc++.so.6` and `zlib.so` available.
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
  }
