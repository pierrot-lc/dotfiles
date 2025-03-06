{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
  };
}
