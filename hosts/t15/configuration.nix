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

  services.hardware.bolt.enable = true;

  networking.hostName = "t15";

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

  # D-Bus service to check the availability of dual-GPU.
  services.switcherooControl.enable = true;

  # Allow unfree packages (NVIDIA).
  nixpkgs.config.allowUnfree = true;

  # Tell Xorg and Wayland to use the nvidia driver.
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [vpl-gpu-rt]; # See https://nixos.wiki/wiki/Intel_Graphics.
  };

  # See https://nixos.wiki/wiki/Nvidia.
  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors.
    modesetting.enable = true;

    # Use the open source version of the kernel module.
    # Only available on driver 515.43.04+
    open = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application
    # crashes after waking up from sleep. This fixes it by saving the entire
    # VRAM memory to /tmp/ instead of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Enable the nvidia settings menu.
    nvidiaSettings = false;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # See https://nixos.wiki/wiki/Nvidia#Laptop_Configuration:_Hybrid_Graphics_.28Nvidia_Optimus_PRIME.29.
    prime = {
      reverseSync.enable = true;
      allowExternalGpu = false;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # # Create a boot entry with offload enabled. This is a power efficient entry.
  # specialisation.on-the-go.configuration = {
  #   system.nixos.tags = ["on-the-go"];
  #   hardware.nvidia = {
  #     powerManagement.enable = lib.mkForce true;
  #     powerManagement.finegrained = lib.mkForce true;
  #
  #     prime = {
  #       offload.enable = lib.mkForce true;
  #       offload.enableOffloadCmd = lib.mkForce true;
  #       sync.enable = lib.mkForce false;
  #       reverseSync.enable = lib.mkForce false;
  #     };
  #   };
  # };

  nixpkgs.config.cudaSupport = true;
}
