#!/bin/bash

mkdir -v /var/cache/swap
cd /var/cache/swap
dd if=/dev/zero of=swapfile bs=1K count=4M
chmod 600 swapfile
mkswap swapfile
swapon swapfile

mkdir -p ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
travis_retry curl -L https://www.stackage.org/stack/linux-x86_64 | tar xz --wildcards --strip-components=1 -C ~/.local/bin '*/stack'

# don't forget to turn the swap off after you're done with building `lens`
sudo swapoff swapfile