#!/usr/bin/env bash

# :%s/nvme0n1p1/sda1/g
# :%s/nvme0n1p2/sda2/g
# :%s/nvme0n1/sda/g

mkfs.fat -F 32 -n ESP /dev/sda1
mkfs.btrfs -L nixos /dev/sda2
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@nix
btrfs subvolume create /mnt/@swap
btrfs subvolume create /mnt/@snapshots
umount /mnt

lsblk /dev/sda --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
