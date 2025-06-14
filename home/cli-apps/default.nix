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

  home.packages = with pkgs; [
    caligula
    circumflex
    curl
    du-dust
    duf
    fd
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
    python3Full
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
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./khard.nix
    ./myrepos.nix
    ./nvim.nix
    ./qcal.nix
    ./starship.nix
    ./television.nix
  ];
}
