{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	kdePackages.breeze-gtk
	adwaita-icon-theme
	gsettings-desktop-schemas
	(tela-circle-icon-theme.override {
	    colorVariants = [ "black" ];
	})
    ];
    
    programs.dconf.enable = true;
}
