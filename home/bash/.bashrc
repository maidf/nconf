#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# rust代理
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

sudo() {
    sudo $@
}
alias grep='grep --color=auto'
alias l='eza --color=always --icons -GF -a -T -L 3'
alias la='eza --color=always --icons -aF'
alias ll='eza --color=always --icons -alF'
alias ls='eza -F --color=always --icons'

bn() {
    bun "$@"
}
bi() {
    bun install "$@"
}
dev() {
    if [ -z "$@" ]; then
        bun dev
    else
        bun "dev:$*"
    fi
}

nrs() {
    cd ~/nconf
    sudo nixos-rebuild switch --flake .
    cd -
}

ndev() {
    nix develop
}

repl() {
    nix repl
}

# 通用命令
alias ..='cd ..'
alias i='install '
alias neo='fastfetch'

PS1='[\u@\h \W] '

clear_color="\e[0m"
clear_color="\e[0m"
red_color="\e[31m"
blue_color="\e[34m"
green_color="\e[32m"

git_branch_name="[]"

fn_get_git_branch() {
  git_branch_name=$(git branch --show-current 2>/dev/null)
  if [ $git_branch_name ]
  then
    echo "${green_color}["$left_str" "$git_branch_name$right_str"]${clear_color}"
  fi
}

fn_get_workspace() {
  echo "${blue_color}[\w]${clear_color}"
}

fn_get_user_name() {
  echo "${red_color}[\u@\h]${clear_color}"
}

PS1="$(fn_get_user_name)$(fn_get_workspace)$(fn_get_git_branch)\n> "