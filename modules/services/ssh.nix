{ ... }:

{
    serivces.openssh = {
	enable = true;
	settings = {
	    PasswordAuthentication = true;
	    PermitRootLogin = "no";
	};
    };
}
