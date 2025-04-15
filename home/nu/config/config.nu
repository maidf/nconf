$env.config = {
  # main configuration
  show_banner: false,
  render_right_prompt_on_last_line: true,
#   hooks: {
#     pre_prompt: [{ ||
#       if (which direnv | is-empty) {
#         return
#       }

#       direnv export json | from json | default {} | load-env
#       if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
#         $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
#       }
#     }]
#   }
}
  
use pnpm *
use devenv *

alias ll = ls -l
alias la = ls -a
alias lla = ll -a
alias l = la
alias ndev = nix develop
alias repl = nix repl
alias neo = fastfetch
alias nv = nvim
alias i = install
alias s = search

# sudo nixos-rebuild switch 带默认git信息
def nr [msg: string = "upd", path_or_both: string = ., host?: string] {
    cd ~/nconf

    git add .
    nix flake update
    git add .
    git commit -m $msg
    git push origin main

    if $host == null {
        sudo nixos-rebuild switch --flake $"($path_or_both)"
    } else {
        sudo nixos-rebuild switch --flake $"($path_or_both)#($host)"
    }

    cd -
}

def gc [] {
    sudo nix store gc --debug
    sudo nix-collect-garbage --delete-old
}


def greet1 [name = 'ru', ...ex] {
  $"hello ($name) ($ex)"
}


def greet2 [name?: string = "ru"] {
  $"hello ($name)"
}

def greet3 [name: string = "ru"] {
  $"hello ($name)"
}

def greet4 [name: string] {
  $"hello ($name)"
}
