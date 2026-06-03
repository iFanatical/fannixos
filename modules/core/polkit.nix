{ pkgs, ... }:

{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    mate-polkit
  ];
  systemd.user.services.polkit-mate = {
    description = "MATE polkit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authenitcation-agent-1";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
}
