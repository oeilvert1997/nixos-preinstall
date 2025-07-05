#!/usr/bin/env bash

parted /dev/nvme0n1 -- unit MiB print

echo "--------------------------------"

lsblk /dev/nvme0n1 --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINTS,LABEL,UUID
