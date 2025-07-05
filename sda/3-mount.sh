#!/usr/bin/env bash

# :%s/nvme0n1p1/sda1/g
# :%s/nvme0n1p2/sda2/g
# :%s/nvme0n1/sda/g

mount -o compress-force=zstd:1,noatime,subvol=@root /dev/sda2 /mnt
mkdir -p /mnt/{home,nix,swap,snapshots,boot}
mount -o compress-force=zstd:1,noatime,subvol=@home /dev/sda2 /mnt/home
mount -o compress-force=zstd:1,noatime,subvol=@nix /dev/sda2 /mnt/nix
mount -o subvol=@swap /dev/sda2 /mnt/swap
mount -o compress-force=zstd:1,noatime,subvol=@snapshots /dev/sda2 /mnt/snapshots
mount -o noatime /dev/sda1 /mnt/boot
btrfs filesystem mkswapfile --size 8g --uuid clear /mnt/swap/swapfile
lsattr /mnt/swap/swapfile
swapon /mnt/swap/swapfile

lsblk /dev/sda --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
