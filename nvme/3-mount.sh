#!/usr/bin/env bash

mount -o compress-force=zstd:1,noatime,subvol=@root /dev/nvme0n1p2 /mnt
mkdir -p /mnt/{home,nix,swap,snapshots,boot}
mount -o compress-force=zstd:1,noatime,subvol=@home /dev/nvme0n1p2 /mnt/home
mount -o compress-force=zstd:1,noatime,subvol=@nix /dev/nvme0n1p2 /mnt/nix
mount -o noatime,subvol=@swap /dev/nvme0n1p2 /mnt/swap
mount -o compress-force=zstd:1,noatime,subvol=@snapshots /dev/nvme0n1p2 /mnt/snapshots
mount -o noatime,fmask=0077,dmask=0077 /dev/nvme0n1p1 /mnt/boot
btrfs filesystem mkswapfile --size 8g --uuid clear /mnt/swap/swapfile
lsattr /mnt/swap/swapfile
swapon /mnt/swap/swapfile

lsblk /dev/nvme0n1 --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
