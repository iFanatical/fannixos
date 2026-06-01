{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
	vim
	neovim
	git
	wget
	curl
	htop
	btop
	tree
	file
	unzip
	zip
	rsync
	bat
	eza
	fzf
	zoxide
	jq
	ripgrep
	fd
	wireguard-tools
    ];
}
