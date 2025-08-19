{
  programs.bash = {
    enable = true;
    initExtra = /* bash */ ''
      # Aliases to use only if the current terminal is kitty.
      if [ "$TERM" = "xterm-kitty" ]; then
          alias icat="kitty +kitten icat"
          alias ssh="kitty +kitten ssh"
      fi
    '';
    historyIgnore = [
      "exit*"
      "pwd"
    ];
  };
}
