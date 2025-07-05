# nixos-preinstall

```
sudo -i

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