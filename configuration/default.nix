# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  config,
  ...
}: {
  # Overall Nix options.
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "pipe-operators"];
    trusted-users = ["root" "pierrot-lc" "@wheel"];
    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://cuda-maintainers.cachix.org"
      "https://ploop.cachix.org" # Jax related stuffs.
      "https://pierrot-lc.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "ploop.cachix.org-1:i6+Fqarsbf5swqH09RXOEDvxy7Wm7vbiIXu4A9HCg1g="
      "pierrot-lc.cachix.org-1:w7k8ahk6hJ1cqx36IywPkuDSs+nX2lHy2uW7PGZQHoY="
    ];
  };

  # Select kernel.
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11/Wayland windowing system.
  services.xserver.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pierrot-lc = {
    description = "Pierrot LC";
    extraGroups = ["wheel" "networkmanager"];
    isNormalUser = true;
    packages = [];
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    # Enable Ozone Wayland support for Electron and Chromium based applications.
    NIXOS_OZONE_WL = "1";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs;
    [cachix firefox git gparted htop just vim virt-manager wget]
    ++ (lib.optionals config.hardware.hasGPU [nvitop]);

  services.xserver.excludePackages = with pkgs; [xterm];

  programs.dconf.enable = true;

  # Enable virtual webcam (OBS).
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  imports = [
    ./arrs.nix
    ./docker
    ./fonts.nix
    ./gaming.nix
    ./gnome.nix
    ./keyboards.nix
    ./networking.nix
    ./printing.nix
    ./services.nix
    ./virtualisation.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
