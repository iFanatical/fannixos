{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	
	# xorg packages
	xrdb
	xmodmap
	xset
	xsetroot
	xrandr
	
	# decorations and daemons
	picom
	xsettingsd
	sxhkd
	dunst
	libnotify
	xclip
	feh
	maim
    ];
}
