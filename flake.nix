{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {
      vinixdesktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/vinixdesktop/configuration.nix ];
      };
      vinixlaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/vinixlaptop/configuration.nix ];
      };
    };
  };
}