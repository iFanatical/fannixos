{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix-settings.nix
    ./users.nix
    ./packages.nix
    ./polkit.nix
    ./xdg.nix
  ];
}
