{ pkgs, ... }:

{
    nixpkgs.overlays = [
	(final: prev: {
	    dwmblocks = prev.dwmblocks.overrideAttrs (old: {
		src = prev.fetchFromGitHub {
		    owner = "iFanatical";
		    repo = "fandwmblocks";
		    rev = "master";
		    hash = "sha256-pgRfMmFMf68dTFuwHgy1H3jrfeJ5oOaEKuL491U3bpA=";
		};
	    });
	})
    ];

    environment.systemPackages = with pkgs; [ dwmblocks ];
}
