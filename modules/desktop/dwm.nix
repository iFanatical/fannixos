{ pkgs, ... }:

{
    services.xserver.windowManager.dwm.enable = true;
    nixpkgs.overlays = [
	(final: prev: {
	    dwm = prev.dwm.overrideAttrs (old: {
		src = prev.fetchFromGitHub {
		    owner = "iFanatical";
		    repo = "fandwm";
		    rev = "master";
		    hash = "";
		};
	    });
	})
    ];
}
