{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	
	# xorg packages
	xorg.xrdb
	xorg.xmodmap
	xorg.xset
	xorg.xsetroot
	xorg.xrandr
	
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
