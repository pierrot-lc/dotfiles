{pkgs, ...}: {
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      time.disabled = false;
    };
  };

  programs.thefuck = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [
    bat
    bottom
    btop
    comma
    curl
    du-dust
    duf
    fd
    ffmpeg
    file
    gdu
    git-crypt
    glances
    glow
    gnumake
    gnutar
    imagemagick
    jq
    just
    keymapp
    mullvad-vpn
    neofetch
    pandoc
    popcorntime
    python3Full
    ranger
    ripgrep
    satty
    sshfs
    tldr
    tree
    unzip
    wl-clipboard
    zip
  ];
}
