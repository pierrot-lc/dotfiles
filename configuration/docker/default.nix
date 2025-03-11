{
  config,
  lib,
  ...
}: let
  pihole = import ./pihole.nix {};
in {
  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = ["pierrot-lc"];

    virtualisation.oci-containers.containers = lib.mkMerge [
      (lib.mkIf config.docker.pihole {pihole = pihole;})
    ];
  };
  options = {
    docker = {
      enable = lib.mkEnableOption "Enable Docker daemon";
      pihole = lib.mkEnableOption "Run Pi-hole image";
    };
  };
}
