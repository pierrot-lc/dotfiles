{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      commit-mono
      dejavu_fonts
      jetbrains-mono
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
