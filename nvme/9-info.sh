#!/usr/bin/env bash

# :%s/nvme0n1p1/sda1/g
# :%s/nvme0n1p2/sda2/g
# :%s/nvme0n1/sda/g

parted /dev/nvme0n1 -- unit MiB print

lsblk /dev/nvme0n1 --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
