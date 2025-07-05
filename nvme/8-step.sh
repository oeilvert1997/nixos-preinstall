#!/usr/bin/env bash

cat <<EOS
sudo -i

1-part.sh
2-btrfs.sh
3-mount.sh

nixos-generate-config --root /mnt

nixos-install --root /mnt --flake github:oeilvert1997/nixos-config#<hostname> --show-trace --verbose

nixos-enter --root /mnt -c 'passwd <username>'

reboot

EOS
