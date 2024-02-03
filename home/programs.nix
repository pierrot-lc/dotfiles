{ pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.firefox = {
    enable = true;
  };

  home.sessionVariables = {
    BROWSER = "firefox";
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
    };
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
    unzip
    wl-clipboard
    zip
  ];
}
