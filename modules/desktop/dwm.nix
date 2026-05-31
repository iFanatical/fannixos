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
		    hash = "sha256-onsp8nDL37+Y+1vasSZFF1rhDjVxZ/bZGCwMRDalw8k=";
		};
		
		nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ prev.pkg-config ];

		buildInputs = (old.buildInputs or []) ++ (with prev; [
		    xorg.libxcb
		    xorg.xcbutil
		    xorg.xcbutilwm
		    xorg.libXrender
		]);

		postPatch = (old.postPatch or "") + ''
		    sed -i \
			-e 's|^X11INC.*|X11INC =|' \
	            	-e 's|^X11LIB.*|X11LIB =|' \
		    	-e 's|^FREETYPEINC.*|FREETYPEINC =|' \
		    	config.mk
		'';
	    });
	})
    ];
}
