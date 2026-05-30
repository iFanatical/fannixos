{ config, pkgs, ... }:

{
    home.username = "fanatical";
    home.homeDirectory = "/home/fanatical";
    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
    programs.git = {
	enable = true;
	userName = "Fanatical";
	userEmail = "theawpportunist@gmail.com";
    };
}
