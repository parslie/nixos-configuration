{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/users/viktor.nix

    ../../modules/bluetooth.nix
    ../../modules/console.nix
    ../../modules/flakes.nix
    ../../modules/gnome.nix
    ../../modules/locale.nix
    ../../modules/packages.nix
    ../../modules/pipewire.nix
    ../../modules/xserver.nix
  ];

  networking.hostName = "vinixlaptop";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}