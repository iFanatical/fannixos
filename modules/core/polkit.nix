{ pkgs, ... }:

{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    mate-polkit
  ];
  
    environment.etc."dwm/autostart.sh" = {
    text = ''
#!/usr/bin/env bash
dwmblocks &
${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &
    '';
    mode = "0755";

  };
}
