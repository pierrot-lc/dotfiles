{
  pkgs,
  lib,
  config,
  private,
  ...
}: let
  newsflashJsonPath = "${config.xdg.configHome}/news-flash/newsflash.json";
  freshrssJsonPath = "${config.xdg.configHome}/news-flash/freshrss.json";

  # The default package does not add newsflash to the desktop list of
  # executables.
  newsflash = pkgs.newsflash.overrideAttrs (oldAttrs: {
    desktopItems = ["$out/share/applications/io.gitlab.news_flash.NewsFlash.desktop"];
  });
in {
  home.packages = [newsflash];

  # Add the freshrss account.
  home.file."${freshrssJsonPath}".text = builtins.toJSON private.newsflash;

  # Specify the backend to be freshrss. The config file should remain editable
  # so the file is generated from the following activation script.
  home.activation.newsflashBackend =
    lib.hm.dag.entryAfter ["installPackages"] /* bash */ ''
      # Create the JSON file if it does not exists already. The JSON file is
      # automatically created when the application is launched. We use a dumb
      # command to do so.
      ${newsflash}/bin/io.gitlab.news_flash.NewsFlash -h > /dev/null

      # Add the freshrss backend.
      cat "${newsflashJsonPath}" | ${pkgs.jq}/bin/jq --arg "backend" "freshrss" '. + $ARGS.named' > "${newsflashJsonPath}.tmp"
      mv "${newsflashJsonPath}.tmp" "${newsflashJsonPath}"
    '';
}
