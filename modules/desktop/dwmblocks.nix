{ pkgs, ... }:

{
    nixpkgs.overlays = [
	(final: prev: {
	    dwmblocks = prev.dwmblocks.overrideAttrs (old: {
		src = prev.fetchFromGitHub {
		    owner = "iFanatical";
		    repo = "fandwmblocks";
		    rev = "master";
		    hash = "";
		};
	    });
	})
    ];

    environment.systemPackages = with pkgs; [ dwmblocks ];
}
