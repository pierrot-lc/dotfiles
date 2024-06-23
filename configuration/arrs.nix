{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.arrs.enable {
    services.transmission = {
      enable = true;
      downloadDirPermissions = "770";
    };

    # Prowlarr setup. Accessible at http://localhost:9696.
    services.prowlarr = {
      enable = true;
    };

    # Sonarr setup. Accessible at http://localhost:8989.
    services.sonarr = {
      enable = true;
    };
    users.users.sonarr.extraGroups = ["transmission"];
  };
}
