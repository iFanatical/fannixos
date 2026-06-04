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
	  hash = "sha256-WQkn7Gr+G7zVkVeBenDuEOa5ZKWfWM3EA/Ofb4FzX7M=";
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
