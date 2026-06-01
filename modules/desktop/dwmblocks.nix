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
		postPatch = (old.postPatch or "") + ''
		sed -i \
		    -e 's|-I''${X11INC}||g' \
		    -e 's|-L''${X11LIB}||g' \
		    config.mk 2>/dev/null || true
		'';
	    });
	})
    ];

    environment.systemPackages = with pkgs; [ dwmblocks ];
}
