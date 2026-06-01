{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	kdePackages.breeze-gtk
	tela-circle-icon-theme
	adwaita-icon-theme
	gsettings-desktop-schemas
    ];
    
    programs.dconf.enable = true;
}
