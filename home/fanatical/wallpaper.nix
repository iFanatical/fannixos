{ ... }:

{
    home.file."source-files/fehbg.sh" = {
	source = .files/fehbg.sh
	executable = true;
    };

    home.file."Pictures/wallpapers" = {
	source = ./themes/wallpapers;
	recursive = true;
    };
}
