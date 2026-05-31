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
	haskellPackages.greenclip
	xclip
	feh
	maim
	glib

	# apps
	rofi
	pcmanfm
	pavucontrol
	galculator
	playerctl
	brave
	firefox
	fastfetch
    ];
}
