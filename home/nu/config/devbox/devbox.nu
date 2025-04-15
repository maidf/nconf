export alias box = devbox
export alias "box gen" = devbox generate
export alias "box svc" = devbox services
export alias "box sh" = devbox shell

export def "box init" [] {
    devbox init
    devbox generate direnv
    devbox generate readme readme.md
}