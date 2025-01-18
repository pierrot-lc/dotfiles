{
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ./init_extra.sh;
    historyIgnore = [
      "exit*"
      "pwd"
    ];
  };
}
