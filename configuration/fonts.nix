{pkgs, ...}:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
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

    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrains Mono" "FiraCode" ];
        sansSerif = [ "DejaVu Sans" ];
      };
    };
  };
}
