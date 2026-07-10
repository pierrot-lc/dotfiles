{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # NixOS-level options.
  docker.enable = true;

  networking.hostName = "tiny-tower";
  programs.coolercontrol.enable = true;

  networking = {
    networkmanager.enable = false;
    useDHCP = false;
    useNetworkd = true;
    wireless.enable = true;
  };

  systemd.network = {
    enable = true;
    networks."10-enp7s0" = {
      matchConfig.Name = "enp7s0";
      address = ["134.59.131.74/24"];
      routes = [{Gateway = "134.59.131.254";}];
      networkConfig.DNS = ["134.59.190.7"];
      linkConfig.RequiredForOnline = "routable";
    };
  };

  specialisation = {
    dynamic-network.configuration = {
      system.nixos.tags = ["dynamic-network"];
      networking = {
        networkmanager.enable = lib.mkForce true;
        useDHCP = lib.mkForce true;
        useNetworkd = lib.mkForce false;
        wireless.enable = lib.mkForce true;
      };

      systemd.network.enable = lib.mkForce false;
    };
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = ["pierrot-lc"];
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };

  users.users."pierrot-lc".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBs7sAEMmR9+Ej6rTE4ke1RmcsaUt6Y2rM2iLC48Iq/p pierrot-lc@tiny-tower"
  ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      secureBoot.enable = true;
      style = {
        interface.resolution = "1920x1080";
        graphicalTerminal.font.scale = "2x2";
      };
    };
  };
  environment.systemPackages = [
    pkgs.coolercontrol.coolercontrold
    pkgs.sbctl
    pkgs.tmux
  ];

  # Tell Xorg and Wayland to use the nvidia driver.
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # See https://nixos.wiki/wiki/Nvidia.
  hardware.nvidia = {
    branch = "latest";

    # Use the open source version of the kernel module.
    # Only available on driver 515.43.04+
    open = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application
    # crashes after waking up from sleep. This fixes it by saving the entire
    # VRAM memory to /tmp/ instead of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Enable the nvidia settings menu.
    nvidiaSettings = true;
  };

  nixpkgs.config.cudaSupport = true;
}
