{pkgs, ...}: {
  programs.java.enable = true;
  home.packages = with pkgs; [
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-moderne
    libreoffice
  ];
}
