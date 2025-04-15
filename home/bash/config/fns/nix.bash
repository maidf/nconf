upd() {
    nix flake update
}

rb() {
    cd ~/nconf
    sudo nixos-rebuild switch --flake .
    cd -
}
gc() {
    sudo nix store gc --debug
    sudo nix-collect-garbage --delete-old
}