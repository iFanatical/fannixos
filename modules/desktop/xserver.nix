{ pkgs, ... }:

{
    services.xserver = {
	enable = true;
	xkb = {
	    layout = "us";
	    options = "";
	};

	displayManager.startx.enable = true;
    };
    services.libinput.enable = true;

    services.xserver.serverFlagsSection = ''
	Option "BlankTime" "0"
	Option "StandbyTime" "0"
	Option "SuspendTime" "0"
	Option "OffTime" "0"
    '';
    
    fonts.packages = with pkgs; [
	dejavu_fonts
	liberation_ttf
	noto-fonts
	noto-fonts-color-emoji
	nerd-fonts.fira-code
	nerd-fonts.jetbrains-mono
	ubuntu_font_family
    ];
}
