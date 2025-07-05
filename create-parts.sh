#!/bin/bash
set -eux

DISK="/dev/sda"
ESP_MIB=512

MEM_MIB=$(free --mebi | awk '/^Mem:/{print $2}')
DISK_MIB=$(lsblk -b -dn -o SIZE "$DISK" | awk '{print int($1/1024/1024)}')

SWAP_MIB=$MEM_MIB
ROOT_MIB=$((DISK_MIB - ESP_MIB - SWAP_MIB - 1))

echo "------- PARTITION LAYOUT -------"
echo "disk: ${DISK_MIB} MiB"
echo "ESP : ${ESP_MIB} MiB"
echo "root: ${ROOT_MIB} MiB"
echo "swap: ${SWAP_MIB} MiB"
echo "--------------------------------"

read -p "WARNING: All data on this disk will be destroyed. Continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted"
  exit 0
fi

parted -s "$DISK" -- mklabel gpt

parted -s --align optimal "$DISK" -- \
  mkpart ESP fat32 1MiB $((ESP_MIB + 1))MiB \
  set 1 esp on


parted -s --align optimal "$DISK" -- \
  mkpart root ext4 $((ESP_MIB + 1))MiB $((ESP_MIB + ROOT_MIB + 1))MiB


parted -s --align optimal "$DISK" -- \
  mkpart swap linux-swap $((ESP_MIB + ROOT_MIB + 1))MiB 100%

echo "Partition creation complete"

sh ./print-parts.sh
