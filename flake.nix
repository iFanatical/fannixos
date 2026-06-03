{
    description = "Fanatical's NixOS configurations";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay?ref=dev-for-26.05";
    };

    outputs = { self, nixpkgs, xlibre-overlay, ... }@inputs: {
	nixosConfigurations = {
	    fanzbook-nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [
		    ./hosts/fanzbook-nixos
		    xlibre-overlay.nixosModules.overlay-xlibre-xserver
		    xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
		];
	    };
	};
    };
}
