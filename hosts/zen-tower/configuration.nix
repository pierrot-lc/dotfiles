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

  networking.hostName = "zen-tower";

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
      extraEntries = ''
        /Windows
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };
  environment.systemPackages = [pkgs.sbctl]; # Generate secure boot keys.

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
