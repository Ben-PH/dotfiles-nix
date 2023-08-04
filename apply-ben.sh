#!/bin/sh

pushd ~/.dotfiles
nix build .#homeManagerConfigurations.ben.activationPackage && 
./result/activate
popd
