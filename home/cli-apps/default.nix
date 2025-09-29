{pkgs, ...}: {
  programs.autojump.enable = true;

  programs.bottom.enable = true;
  home.shellAliases.htop = "btm";

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fastfetch.enable = true;
  home.shellAliases = {
    neofetch = "fastfetch";
    ff = "fastfetch";
  };

  programs.fd.enable = true;
  home.shellAliases = {
    find = "fd";
  };

  home.packages = with pkgs; [
    caligula
    circumflex
    curl
    du-dust
    duf
    ffmpeg
    file
    gdu
    glances
    gnumake
    gnutar
    imagemagick
    jq
    just
    pandoc
    python3
    ripgrep
    tldr
    tree
    typst
    unzip
    wl-clipboard
    zip
  ];

  imports = [
    ./bat
    ./buku.nix
    ./feh.nix
    ./git.nix
    ./khard.nix
    ./myrepos.nix
    ./nvim.nix
    ./qcal.nix
    ./starship.nix
    ./television
  ];
}
