{
  programs.fish = {
    enable = true;
    interactiveShellInit = /* fish */ ''
        if test "$TERMINAL" = "kitty"
          alias icat="kitty +kitten icat"
          alias ssh="kitty +kitten ssh"
        end
      '';
  };
}
