{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
    cantarell-fonts
    commit-mono
    dejavu_fonts
    emojione
    freefont_ttf
    gyre-fonts
    jetbrains-mono
    liberation_ttf
    material-symbols
    noto-fonts
    noto-fonts-color-emoji
    source-code-pro
    source-sans
    source-sans-pro
    symbola
    twemoji-color-font
    twitter-color-emoji
    unifont
  ];

  # Discover installed fonts by home-manager and enable them.
  # But it masks already installed fonts :(.
  fonts.fontconfig.enable = true;
}
