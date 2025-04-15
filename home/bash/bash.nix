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
  };

  home.file.".bashrc".source = lib.mkForce ./bashrc;
  home.file.".bash_profile".source = lib.mkForce ./bash_profile;
  home.file.".config/bash/" = lib.mkForce {
    source = ./config;
    recursive = true;
  };
}
