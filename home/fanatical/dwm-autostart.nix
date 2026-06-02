{ ... }:

{    
  home.file = {
    ".local/share/dwm/autostart.sh" = {
      source = ./files/dwm-autostart.sh;
      executable = true;
    };
  };
}

