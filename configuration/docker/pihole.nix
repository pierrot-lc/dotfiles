# From https://github.com/pi-hole/docker-pi-hole/
{
  image = "pihole/pihole:latest";
  ports = [
    "53:53/tcp"
    "53:53/udp"
    "80:80/tcp"
    "443:443/tcp"
  ];
  environment = {
    TZ = "Europe/Paris";
    FTLCONF_webserver_api_password = "pass";
    FTLCONF_dns_listeningMode = "all";
  };
  volumes = [
    "./etc-pihole:/etc/pihole"
  ];
  capabilities = {
    NET_ADMIN = true;
    SYS_TIME = true;
    SYS_NICE = true;
  };
}
