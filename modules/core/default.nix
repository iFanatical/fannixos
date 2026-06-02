{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./neovim.nix
    ./nix-settings.nix
    ./packages.nix
    ./polkit.nix
    ./users.nix
    ./xdg.nix
  ];
}
