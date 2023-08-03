
#!/bin/sh

pushd ~/.dotfiles/users
home-manager switch -f ./ben/home.nix
popd
