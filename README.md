# Fanatical's NixOS configurations

Multi-host NixOS flake.

## Hosts

- `laptop` — HP ZBook Firefly 14 G7

## Installation

```bash
cd /tmp
git clone https://github.com/iFanatical/fannixos.git
sudo nixos-generate-config --root /mnt
sudo cp /mnt/etc/nixos/hardware-configuration.nix /tmp/fannixos/hosts/laptop/
sudo nixos-install --flake /tmp/fannixos/nixos#laptop --no-root-passwd
```
