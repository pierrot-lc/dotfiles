let
  # Thanks to https://github.com/ml-feeds for providing additional feeds.
  sources = ./sources.toml
    |> builtins.readFile
    |> builtins.fromTOML
    |> builtins.getAttr "sources";
in {
  programs.newsboat = {
    enable = true;
    maxItems = 40;
    urls = sources;
    extraConfig = ''
      # Taken from here: https://github.com/dracula/newsboat/blob/main/newsboat
      # Thanks!
      color background default default
      color listnormal color255 default
      color listfocus color238 color255 standout
      color listnormal_unread color47 default
      color listfocus_unread color238 color47 standout
      color info color141 color236

      # Highlights
      highlight all "---.*---" yellow
      highlight feedlist ".*(0/0))" black
      highlight article "(^Feed:|^Title:|^Date:|^Link:|^Author:)" cyan default bold
      highlight article "https?://[^ ]+" yellow default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default

      bind-key j down
      bind-key k up
      bind-key l next-feed
      bind-key h prev-feed
      bind-key x goto-url
    '';
  };
}
