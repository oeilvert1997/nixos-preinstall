#!/usr/bin/env bash

# :%s/nvme0n1p1/sda1/g
# :%s/nvme0n1p2/sda2/g
# :%s/nvme0n1/sda/g

parted /dev/sda -- unit MiB print

lsblk /dev/sda --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
