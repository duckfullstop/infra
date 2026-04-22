{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix, disko }@attrs: {
    # Hetzner
    nixosConfigurations.hnbg1-k-a = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = attrs;
      modules = [ 
        ./machines/hnbg1-k-a.nix
      ];
    };
  };
}