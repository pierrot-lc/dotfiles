{
  programs.newsboat = {
    enable = true;
    maxItems = 40;
    urls = [
      {
        tags = ["general"];
        url = "https://knowablemagazine.org/rss";
        title = "Knowable Magazine";
      }
      {
        tags = ["general"];
        url = "https://kagi.com/smallweb/appreciated";
        title = "Kagi Small Web - Appreciated";
      }
      {
        tags = ["linux"];
        url = "https://news.itsfoss.com/latest/rss/";
        title = "It's FOSS News";
      }
      {
        tags = ["linux"];
        url = "https://www.phoronix.com/rss.php";
        title = "Phoronix";
      }
      {
        tags = ["tech"];
        url = "https://www.theverge.com/rss/index.xml";
        title = "The Verge";
      }
      {
        tags = ["tech"];
        url = "https://techcrunch.com/feed/";
        title = "Tech Crunch";
      }
      {
        tags = ["tech"];
        url = "http://feeds.arstechnica.com/arstechnica/index";
        title = "Ars Technica";
      }
      {
        tags = ["tech"];
        url = "https://kagi.com/api/v1/smallweb/feed/?gh";
        title = "Kagi Small Web - Code";
      }
      {
        tags = ["AI"];
        url = "https://huggingface.co/blog/feed.xml";
        title = "HuggingFace Blog";
      }
      {
        tags = ["AI"];
        url = "https://buttondown.email/ainews/rss";
        title = "AI News";
      }
      # Thanks to https://github.com/ml-feeds for providing these unofficial feeds.
      {
        tags = ["AI"];
        url = "https://us-east1-ml-feeds.cloudfunctions.net/pwc/trending";
        title = "Paper With Code - Trending";
      }
      {
        tags = ["AI"];
        url = "https://us-east1-ml-feeds.cloudfunctions.net/pwc/latest";
        title = "Paper With Code - Latest";
      }
      {
        tags = ["AI"];
        url = "https://us-east1-ml-feeds.cloudfunctions.net/arxiv-daily-ml";
        title = "Arxiv Daily ML";
      }
      {
        tags = ["AI"];
        url = "https://us-east1-ml-feeds.cloudfunctions.net/kdnuggets";
        title = "KDnuggets";
      }
    ];
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
