#! /usr/bin/env bash

# Have to install curl to install nix package manager
sudo apt install curl -y

# Install nix package manager
sh <(curl -L https://nixos.org/nix/install) --daemon --yes

# Remove programs on ubuntu so there are no conflicts with nix packages
./remove-programs.sh

# Source to get nix commands
source /etc/profile

# Run the nix flake configuration 
nix-shell -p home-manager \
  --run "home-manager switch \
    -b backup \
    --extra-experimental-features 'nix-command flakes' \
    --flake .#base"
