{
  home.shellAliases = {
    chgrp = "chgrp --preserve-root";
    chmod = "chmod --preserve-root";
    chown = "chown --preserve-root";
    count = "ls -l | wc -l";
    df = "df -h";
    ducks = "du -h --max-depth=1 | sort -hr | head";
    dust = "dust --reverse";
    env = "env | sort";
    ff = "find . -name "; # Find a file from the current directory.
    find = "find";
    forecast = "curl wttr.in"; # Show meteo.
    grep = "rg";
    hsi = "history | grep -i"; # Search in history.
    ip4 = "curl -s https://api.ipify.org";
    ip6 = "curl -s https://api6.ipify.org";
    kk = "ll";
    pva = "source .venv/bin/activate";
    pvc = "python3 -m venv .venv; source .venv/bin/activate";
    rm = "rm --preserve-root";
    sl = "ls";
    su = "sudo -i";
    top = "htop";
    wget = "wget -c"; # Resume by default.
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = /* bash */ ''
        export PATH="$HOME/go/bin:$PATH"
        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"
      '';
    initExtra = builtins.readFile ./init_extra.sh;
    historyIgnore = [
      "exit*"
      "pwd"
    ];
  };
}
