{pkgs, ...}: let
  # The default package does not add planify to the desktop list of
  # executables.
  planify = pkgs.newsflash.overrideAttrs (oldAttrs: {
    desktopItems = ["${pkgs.planify}/share/applications/io.github.alainm23.planify.desktop"];
  });
in {
  home.packages = [planify];
}
