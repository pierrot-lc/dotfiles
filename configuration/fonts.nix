{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      commit-mono
      dejavu_fonts
      fira
      fira-code
      fira-math
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-color-emoji
      twemoji-color-font
      unifont
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrains Mono" "FiraCode"];
        sansSerif = ["DejaVu Sans"];
      };
    };
  };
}
