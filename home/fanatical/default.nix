{ config, pkgs, ... }:

let
    rofiConfig = pkgs.runCommand "rofi-config" {} ''
	mkdir -p $out
	cp -r ${./files/rofi}/* $out/
	chmod +x $(find $out -name "*.sh")
    '';

    bashScripts = pkgs.runCommand "bash-scripts" {}''
	mkdir -p $out
	cp -r ${./scripts}/* $out/
	chmod +x $out/*
    '';
in

{
    home.username = "fanatical";
    home.homeDirectory = "/home/fanatical";
    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
    programs.git = {
	enable = true;
	settings = {
	    user = {
	    	name = "Fanatical";
		email = "theawpportunist@gmail.com";
	    };
	};
    };
    
    programs.alacritty.enable = true;
    
    xdg.userDirs = {
	enable = true;
	createDirectories = true;
	pictures = "${config.home.homeDirectory}/Pictures";
	documents = "${config.home.homeDirectory}/Documents";
	download = "${config.home.homeDirectory}/Downloads";
	videos = "${config.home.homeDirectory}/Videos";
	music = "${config.home.homeDirectory}/Music";
	desktop = "${config.home.homeDirectory}/Desktop";
    };

    xdg.configFile = {
	"picom/picom.conf".source = ./files/picom.conf;
	"xsettingsd/xsettingsd.conf".source = ./files/xsettingsd.conf;
	"dunst/dunstrc".source = ./files/dunstrc;
	"alacritty/alacritty.toml".source = ./files/alacritty.toml;
	"fastfetch/config.jsonc".source = ./files/fastfetch.jsonc;
	"sxhkd/sxhkdrc".source = ./files/sxhkdrc;
	rofi = {
	    source = rofiConfig;
	    recursive = true;
	};
    };
    
    home.file.".local/bin" = {
	source = bashScripts;
	recursive = true;
    };

    home.file.".xinitrc".text = ''
    #!/usr/bin/env bash

    export SCRIPTS="$HOME/.local/bin"
    chmod +x "$SCRIPTS"/*.sh "$SCRIPTS"/fanos-* 2>/dev/null

    sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &
    picom &
    dunst &
    xsettingsd &

    greenclip daemon &

    feh --big-fill ~/.background.jpg 2>/dev/null || xsetroot -solid '#1e1e2e'

    exec dwm 2> ~/.dwm.log;
    '';
}
