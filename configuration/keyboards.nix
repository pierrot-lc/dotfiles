{pkgs, ...}: {
  # Set keymaps.
  console.keyMap = "fr";
  services.xserver.xkb.layout = "fr";

  # Enable special udev rules for my keyboards.
  hardware.keyboard.qmk.enable = true;
  hardware.keyboard.zsa.enable = true;

  environment.systemPackages = [pkgs.via];
  services.udev.packages = [pkgs.via];
}
