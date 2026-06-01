{ ... }:

{
    home.file = {
	"source-files/fehbg.sh" = {
	    source = .files/fehbg.sh
	    executable = true;
	};
	"Pictures/wallpapers" = {
	    source = ./themes/wallpapers;
	    recursive = true;
	};
    };
}
