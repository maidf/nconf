$env.config = {
  # main configuration
  show_banner: false,
  render_right_prompt_on_last_line: true,
}
  
use pnpm *
use devenv *

alias ll = ls -l
alias la = ls -a
alias lla = ll -a
alias l = la
alias repl = nix repl
alias neo = fastfetch

# sudo nixos-rebuild switch 带默认git信息
def nr [msg: string = "upd", path_or_both: string = ., host?: string] {
    cd ~/nconf

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