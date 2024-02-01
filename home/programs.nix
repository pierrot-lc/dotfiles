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

  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "pierrotlc@proton.me";
    userName = "Pierrot LC";
    aliases = {
      a = "add";
      c = "commit";
      d = "diff";
      p = "pull";
      P = "push";
      r = "restore";
      s = "status";
    };
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "master";
      pull.rebase = true;
    };
    ignores = [
      "**/*.pyc"
      "**/__pycache__"
      ".venv"
    ];
    signing = {
      key = "9FD5351D70EB6A4C";
      signByDefault = true;
    };
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
