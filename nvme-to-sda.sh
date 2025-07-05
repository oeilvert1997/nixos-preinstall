#!/usr/bin/env bash

cp -r ./nvme ./sda
find ./sda -type f -exec sed -i 's/nvme0n1p2/sda2/g' {} \;
find ./sda -type f -exec sed -i 's/nvme0n1p1/sda1/g' {} \;
find ./sda -type f -exec sed -i 's/nvme0n1/sda/g' {} \;