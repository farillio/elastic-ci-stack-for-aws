#!/bin/bash
set -eu -o pipefail

echo "Set vm.max_map_count high enough to support elastic search"
echo "vm.max_map_count=262144" > 50-farillio.conf
sudo mv 50-farillio.conf /etc/sysctl.d/50-farillio.conf
sudo chown root:root /etc/sysctl.d/50-farillio.conf

echo "Install bats"
git clone https://github.com/bats-core/bats-core.git
cd bats-core
sudo ./install.sh /usr/local/bats

echo "Link bats into /usr/local/bin"
sudo ln -s /usr/local/bats/bin/* /usr/local/bin/
