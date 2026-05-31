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
	ddcutil
	brightnessctl

	# apps
	rofi
	pcmanfm
	pavucontrol
	pamixer
	cliphist
	xcolor
	ffmpeg
	galculator
	playerctl
	brave
	firefox
	fastfetch
    ];
}
