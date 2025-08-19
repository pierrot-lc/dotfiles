{
  home.shellAliases = {
    chgrp = "chgrp --preserve-root";
    chmod = "chmod --preserve-root";
    chown = "chown --preserve-root";
    df = "df -h";
    ducks = "du -h --max-depth=1 | sort -hr | head";
    dust = "dust --reverse";
    forecast = "curl wttr.in"; # Show meteo.
    grep = "rg";
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

  imports = [
    ./bash.nix
  ];
}
