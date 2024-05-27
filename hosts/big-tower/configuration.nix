# This is some specific configuration for the given machine.
{
  config,
  pkgs,
  ...
}: {
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

  environment.systemPackages = with pkgs; [
    nvitop
  ];

  # Allow unfree packages (NVIDIA).
  nixpkgs.config.allowUnfree = true;

  # See https://nixos.wiki/wiki/Nvidia.
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    # Enable VDPAU and VA-API support.
    extraPackages = with pkgs; [vaapiVdpau];
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
    nvidiaSettings = false;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  nixpkgs.config.cudaSupport = true;
}
