{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = ["pierrot-lc"];
  };
}
