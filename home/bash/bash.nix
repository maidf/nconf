{ lib, ... }:

{
  # home.file.".bashrc".source = lib.mkForce ./.bashrc;
  # home.file.".bash_profile".source = lib.mkForce ./.bash_profile;
  programs.bash = {
    enable = true;
    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
    shellAliases = lib.mkForce {
      sudo = "sudo ";
      l = "eza --color=always --icons -GF -a -T -L 3";
      ls = "eza -F --color=always --icons";
      la = "eza --color=always --icons -aF";
      ll = "eza --color=always --icons -alF";
      ndev = "nix develop";
      repl = "nix repl";
      ".." = "cd ..";
      de = "devenv ";
      neo = "fastfetch";
      nv = "nvim";
      i = "install ";
      s = "search ";
      u = "update ";
    };
    bashrcExtra = lib.mkForce ''
      # rust代理
      export RUSTUP_DIST_SERVER="https://rsproxy.cn"
      export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

      gc() {
        sudo nix store gc --debug
	    sudo nix-collect-garbage --delete-old
      }
      ga() {
        git add .
	      git commit -m 'upd'
      }
      upd() {
        nix flake update
      }
      rb() {
        cd ~/nconf
        sudo nixos-rebuild switch --flake .
	      cd -
      }

      clear_color="\e[0m"
      clear_color="\e[0m"
      red_color="\e[31m"
      blue_color="\e[34m"
      green_color="\e[32m"

      git_branch_name="()"

      fn_get_git_branch() {
        git_branch_name=$(git branch --show-current 2>/dev/null)
        if [ $git_branch_name ]
        then
            echo "$green_color("$left_str" "$git_branch_name$right_str")$clear_color"
        fi
      }

      fn_get_workspace() {
          echo "$blue_color[\w]$clear_color"
      }

      fn_get_user_name() {
          echo "$red_color[\u@\h]$clear_color"
      }

      PS1="$(fn_get_user_name)$(fn_get_git_branch)$(fn_get_workspace)\n> "
    '';
  };
}
