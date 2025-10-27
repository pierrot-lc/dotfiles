{pkgs, ...}: {
  home.packages = with pkgs; [
    proton-authenticator
    proton-pass
    protonmail-desktop
    protonvpn-gui
  ];
}
