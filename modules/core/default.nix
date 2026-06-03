{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix-settings.nix
    ./packages.nix
    ./polkit.nix
    ./shell.nix
    ./users.nix
    ./xdg.nix
  ];
}
