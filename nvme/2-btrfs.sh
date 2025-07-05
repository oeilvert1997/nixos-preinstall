#!/usr/bin/env bash

mkfs.fat -F 32 -n ESP /dev/nvme0n1p1
mkfs.btrfs -f -L nixos /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@nix
btrfs subvolume create /mnt/@swap
btrfs subvolume create /mnt/@snapshots
umount /mnt

lsblk /dev/nvme0n1 --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
