{pkgs, ...}:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
      commit-mono
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      twemoji-color-font
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
