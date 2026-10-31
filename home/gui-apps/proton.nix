{pkgs, ...}: {
  home.packages = with pkgs; [
    proton-authenticator
    proton-cli
    proton-pass
    proton-vpn
    protonmail-desktop
  ];
}
