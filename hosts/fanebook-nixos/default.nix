{ config, pkgs, ... }:

{
    imports = [
	./hardware-configuration.nix
	../../modules/core
	../../modules/hardware/intel.nix
	../../modules/hardware/fingerprint.nix
	../../modules/hardware/bluetooth.nix
	../../modules/desktop
	../../modules/services/ssh.nix
    ];

    networking.hostName = "fanebook-nixos";
    networking.networkmanager.enable = true;

    services.tlp.enable = true;
    services.thermald.enable = true;

    system.stateVersion = "25.11";
}
