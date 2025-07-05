#!/bin/bash
set -eux

cat <<EOS

==> Next Steps

sudo -i

cd nixos-preinstall
sh delete-parts.sh
sh create-parts.sh
sh format-parts.sh
sh setup-mounts.sh

nixos-generate-config --root /mnt

cd /mnt/etc/nixos

git clone https://github.com/oeilvert1997/nixos-config.git
cd ./nixos-config

nixos-install --flake .#<hostname>

nixos-enter --root /mnt -c 'passwd oeilvert'
reboot
EOS
