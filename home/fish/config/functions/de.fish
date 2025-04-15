function de -d "devenv"
    switch $argv[1]
        case sh
            devenv shell $argv
        case s
            devenv search $argv
        case upd
            devenv update $argv
        case '*'
            devenv $argv
    end
end
