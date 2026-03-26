{pkgs, ...}: {
  home.packages = with pkgs; [
    proton-authenticator
    proton-pass
    proton-vpn
    protonmail-desktop
  ];
}
