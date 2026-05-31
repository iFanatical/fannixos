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
		postPatch = (old.postPatch or "") + ''
		    sed -i \
			-e 's|^X11INC.*|X11INC = '"$(pkg-config --variable=includedir x11)"'|' \
			-e 's|^X11LIB.*|X11LIB = '"$(pkg-config --variable=libdir x11)"'|' \
			-e 's|^FREETYPEINC.*|FREETYPEINC = '"$(pkg-config --cflags freetype2 | sed 's/^-I//')"'|' \
			config.mk
		'';
	    });
	})
    ];
}
