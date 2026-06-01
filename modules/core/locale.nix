{ ... }:

{
    time.timeZone = "America/Phoenix";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "us";

    environment.variables = {
	EDITOR = lib.mkForce "nvim";
	VISUAL = lib.mkForce "nvim";
    };
}
