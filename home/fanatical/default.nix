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

    imports = [
	./shell.nix
	./wallpaper.nix
    ];

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

    home.file = {
	".local/bin" = {
	    source = bashScripts;
	    recursive = true;
	};
    
	".themes/Breeze-Dark-TokyoNight" = {
	    source = ./themes/Breeze-Dark-TokyoNight;
	    recursive = true;
	};
	".xinitrc".text = ''
	    #!/usr/bin/env bash
	    
	    export SCRIPTS="$HOME/.local/bin"
	    export PATH="$HOME/.local/bin:$PATH"
	    
	    if [ -f "$HOME/.config/user-dirs.dir" ]; then
	        set -a
	        . "$HOME/.config/user-dirs.dirs"
	        set +a
	    fi
	    
	    cmdemo_script eDP-1 1.2
	    sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &
	    picom &
	    dunst &
	    xsettingsd &
	    greenclip daemon &
	    
	    if [ -e "$HOME/source-files/background" ]; then
	        "$HOME/source-files/fehbg.sh"
	    else
	        xsetroot -solid '#1e1e2e'
	    fi
	    
	    dwmblocks &
	    exec dwm 2> ~/.dwm.log;
    	    '';
    };
    gtk = {
	enable = true;
	font = {
	    name = "JetBrainsMonoNL Nerd Font Propo";
	    size = 10;
	};
	theme = {
	    name = "Breeze-Dark-TokyoNight";
	};
	iconTheme = {
	    name = "Tela-circle-black-dark";
	    package = pkgs.tela-circle-icon-theme;
	};
	cursorTheme = {
	    name = "Adwaita";
	    package = pkgs.adwaita-icon-theme;
	    size = 24;
	};
	gtk3.extraConfig = {
	    gtk-application-prefer-dark-theme = true;
	};
	gtk4.extraConfig = {
	    gtk-application-prefer-dark-theme = true;
	};
    };
    
    qt = {
	enable = true;
	platformTheme.name = "gtk";
	style.name = "gtk2";
    };

    home.pointerCursor = {
	enable = true;
	package = pkgs.adwaita-icon-theme;
	name = "Adwaita";
	size = 24;
	gtk.enable = true;
	x11.enable = true;
    };

}
