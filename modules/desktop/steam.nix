{ ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
