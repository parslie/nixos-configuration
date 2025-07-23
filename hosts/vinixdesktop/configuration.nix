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

  networking.hostName = "vinixdesktop";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot = {
    enable = true;
    windows = {
      "11" = {
        title = "Windows 11";
        efiDeviceHandle = "HD1b";
      };
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/mnt/Personal Files" = {
    device = "/dev/disk/by-uuid/13C33432583C0CBA";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" ];
  };
  fileSystems."/mnt/Extra Storage" = {
    device = "/dev/disk/by-uuid/AE3C3A2B3C39EF49";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" ];
  };

  environment.systemPackages = [
    pkgs.chntpw # Needed for fixing bluetooth pairity when dual-booting
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}