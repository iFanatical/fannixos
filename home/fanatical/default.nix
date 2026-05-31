{ config, pkgs, ... }:

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

    xdg.configFile = {
	"picom/picom.conf".source = ./files/picom.conf;
	"xsettingsd/xsettingsd.conf".source = ./files/xsettingsd.conf;
	"dunst/dunstrc".source = ./files/dunstrc;
	"alacritty/alacritty.toml".source = ./files/alacritty.toml;
	"fastfetch/config.jsonc".source = ./files/fastfetch.jsonc;
	"sxhkd/sxhkdrc".source = ./files/sxhkdrc;
    };
    
    home.file.".local/bin" = {
	source = ./files/scripts;
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

    feh --big-fill ~/.background.jpg 2>/dev/null || xsetroot -solid '#1e1e2e'

    exec dwm 2> ~/.dwm.log;
    '';
}
