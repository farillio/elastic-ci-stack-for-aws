#!/bin/bash
set -eu -o pipefail

echo "Installing ruby-build"
git clone https://github.com/rbenv/ruby-build.git

echo "Installing ruby dependencies"
sudo yum install -y git gcc make readline-devel openssl-devel

echo "Building ruby 2.7.2"
sudo ./ruby-build/bin/ruby-build 2.7.2 /usr/local/ruby/2.7.2

rm -rf ./ruby-build

echo "Linking ruby binaries to /usr/local/bin"
sudo ln -s /usr/local/ruby/2.7.2/bin/* /usr/local/bin/
