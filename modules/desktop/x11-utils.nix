{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	
	# xorg packages
	xorg.xrdb
	xorg.xmodmap
	xorg.xset
	xorg.xsetroot
	xorg.xrandr

	picom
	xsettingsd
	sxhkd
	dunst
	libnotify
	haskellPackages.greenclip
	xclip
	feh
	maim
	glib
    ];
}
