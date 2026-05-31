{
    description = "Fanatical's NixOS configurations";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

	home-manager = {
	    url = "github:nix-community/home-manager/release-25.11";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    };

    outputs = { self, nixpkgs, home-manager, xlibre-overlay, ... }@inputs: {
	nixosConfigurations = {
	    fanzbook-nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [
		    ./hosts/fanzbook-nixos
		    xlibre-overlay.nixosModules.overlay-xlibre-xserver
		    xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
		    home-manager.nixosModules.home-manager
		    {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.users.fanatical = import ./home/fanatical;
			home-manager.extraSpecialArgs = { inherit inputs; };
		    }
		];
	    };
	};
    };
}
