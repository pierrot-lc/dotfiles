{pkgs, ...}: {
  programs.bash = {
    enable = true;
    initExtra = /* bash */ ''
      # Aliases to use only if the current terminal is kitty.
      if [ "$TERM" = "xterm-kitty" ]; then
          alias icat="kitty +kitten icat"
          alias ssh="kitty +kitten ssh"
      fi

      # Launches fish when entering an interactive shell.
      # See https://nixos.wiki/wiki/Fish#Setting_fish_as_your_shell
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    historyIgnore = [
      "exit*"
      "pwd"
    ];
  };
}
