{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.docker.enable {
    virtualisation = {
      docker.enable = true;
      oci-containers.backend = "docker";
    };

    users.extraGroups.docker.members = ["pierrot-lc"];
  };
  options = {
    docker = {
      enable = lib.mkEnableOption "Enable Docker daemon";
    };
  };
}
