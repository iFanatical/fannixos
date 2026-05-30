{ pkgs, ... }:

{
    users.users.fanatical = {
	isNormalUser = true;
	description = "Fanatical";
	extraGroups = [
	    "wheel"
	    "networkmanager"
	    "video"
	    "audio"
	    "input"
	    "dialout"
	];
	initialPassword = "changeme";
	shell = pkgs.zsh;
    };

    users.users.root.hashedPassword = "!";
    programs.zsh.enable = true;
    security.sudo.wheelNeedsPassword = false;
}
