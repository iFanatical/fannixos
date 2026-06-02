{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	kdePackages.breeze-gtk
	libsForQt5.qtstyleplugins
	adwaita-icon-theme
	gsettings-desktop-schemas
	(tela-circle-icon-theme.override {
	    colorVariants = [ "black" ];
	})
    ];
    
    programs.dconf.enable = true;
}
