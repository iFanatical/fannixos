{ pkgs, ... }:

{
    nixpkgs.overlays = [
	(final: prev: {
	    dwmblocks = prev.dwmblocks.overrideAttrs (old: {
		src = prev.fetchFromGitHub {
		    owner = "iFanatical";
		    repo = "fandwmblocks";
		    rev = "master";
		    hash = "sha256-P/paMpQRbsxX+g8qb7j1SjAFni426jjPHIEasmQdvCI=";
		};
	    });
	})
    ];

    environment.systemPackages = with pkgs; [ dwmblocks ];
}
