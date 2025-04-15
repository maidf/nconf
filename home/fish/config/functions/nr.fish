function nr -d "重构nixos"
    cd ~/nconf 
    
    nix flake update
    git add .
    if test (count $argv) -eq 0
        git commit -m "upd"
    else
        git commit -m $argv
    end
    git push origin main

    sudo nixos-rebuild switch --flake .

    cd -
end
