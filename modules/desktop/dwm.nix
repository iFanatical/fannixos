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
		    hash = "sha256-CFpvCK9zdE1aFcNp0uF7bNDAykqjToOPLeV4yAChd3M=";
		};
		
		nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ prev.pkg-config ];

		buildInputs = (old.buildInputs or []) ++ (with prev; [
		    libxcb
		    xcbutil
		    xcbutilwm
		    libXrender
		]);

		postPatch = (old.postPatch or "") + ''
		    sed -i \
			-e 's|-I''${X11INC}||g' \
            		-e 's|-I''${FREETYPEINC}||g' \
            		-e 's|-L''${X11LIB}||g' \
			config.mk
		'';
	    });
	})
    ];
}
