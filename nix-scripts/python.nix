# Useful links:
# - [Nixos Python Wiki](https://wiki.nixos.org/wiki/Python)
# - [Github Python Wiki](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md)
{pkgs ? import <nixpkgs> {}}: let
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
