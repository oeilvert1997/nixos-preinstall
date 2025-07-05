#!/bin/bash
set -eux

parted /dev/sda rm 1
parted /dev/sda rm 2
parted /dev/sda rm 3

sh ./print-parts.sh
