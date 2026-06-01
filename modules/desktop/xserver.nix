{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "";
    };
    displayManager.startx.enable = true;
    
    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
    '';
    
    inputClassSections = [
      ''
        Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "AutoRepeat" "200 35"
      ''
    ];
  };
  services.libinput.enable = true;

  fonts.packages = with pkgs; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    ubuntu-classic
  ];
}
