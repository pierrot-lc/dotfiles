{pkgs, ...}: {
  home.packages = with pkgs; [
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-moderne
    libreoffice
  ];
}
