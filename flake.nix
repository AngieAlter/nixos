{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spotx-nix = {
      url = "github:SpotX-Official/SpotX-Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    zen-browser,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      angie = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/angie.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };

  # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

  #packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  # };
}
