{ config, pkgs, ... }:

{
    home.username = "fanatical";
    home.homeDirectory = "/home/fanatical";
    home.stateVersion = "25.11";
    
    home.file.".xinitrc".text = ''
    #!/usr/bin/env bash
    feh --big-fill ~/.background.jpg 2>/dev/null || xsetroot -solid '#1e1e2e'
    '';

    programs.home-manager.enable = true;
    programs.git = {
	enable = true;
	user.name = "Fanatical";
	user.email = "theawpportunist@gmail.com";
    };
}
