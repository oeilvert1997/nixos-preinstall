# nixos-preinstall

```
sudo -i

sudo swapoff -a
sudo umount -R /mnt 2>/dev/null
wipefs -a /dev/nvme0n1

bash 1-part.sh
bash 2-btrfs.sh
bash 3-mount.sh

nixos-generate-config --root /mnt

nixos-install \
  --root /mnt \
  --flake github:oeilvert1997/nixos-config#<hostname> \
  --no-write-lock-file \
  --show-trace \
  --verbose

nixos-enter --root /mnt -c 'passwd <username>'

exit

reboot
```
