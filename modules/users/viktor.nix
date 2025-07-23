{ pkgs, ... }:

{
  users.users.viktor = {
    isNormalUser = true;
    description = "Viktor Holta";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };
}