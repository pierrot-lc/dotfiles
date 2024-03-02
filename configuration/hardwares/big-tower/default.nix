# This is some specific configuration for the given machine.
{config, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "big-tower";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub = {
  #   enable = true;
  #   device = "nodev";
  #   useOSProber = true;
  # };

  # Allow unfree packages (NVIDIA).
  nixpkgs.config.allowUnfree = true;

  # See https://nixos.wiki/wiki/Nvidia.
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Tell Xorg to use the nvidia driver.
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors.
    modesetting.enable = true;

    # Use the open source version of the kernel module.
    # Only available on driver 515.43.04+ on recents GOUs.
    # See https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Note: cuda is not available with the open kernel!
    open = false;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Enable the nvidia settings menu.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable the full composition pipeline to reduce screen tearing.
    forceFullCompositionPipeline = true;
  };
  nixpkgs.config.CudaSupport = true;
}
