{
    description = "Fanatical's NixOS configurations";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, xlibre-overlay, ... }@inputs: {
	nixosConfigurations = {
	    fanzbook-nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [
		    ./hosts/fanzbook-nixos
		];
	    };
	};
    };
}
