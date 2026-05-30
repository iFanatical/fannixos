{ pkgs, ... }:

{
    hardware.cpu.intel.updateMicrocode = true;

    hardware.graphics = {
	enable = true;
	extraPackages = with pkgs; [
	    intel-media-driver
	    vaapiIntel
	    vaapiVdpau
	    libvdpau-va-gl
	    intel-compute-runtime
	];
    };

    hardware.firmware = with pkgs; [
	sof-firmware
    ];
}
