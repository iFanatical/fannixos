{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	kdePackages.breeze-gtk
	libsForQt5.qtstyleplugins
	libsForQt5.qt5ct
	qt6Packages.qt6ct
	adwaita-icon-theme
	gsettings-desktop-schemas
	(tela-circle-icon-theme.override {
	    colorVariants = [ "black" ];
	})
    ];
    
    programs.dconf.enable = true;
}
