{ pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "maidf";
  home.homeDirectory = "/home/maidf";

  imports = [
    ./nvim/nvim.nix
    # ./nu/nu.nix
    # ./fish/fish.nix
    ./bash/bash.nix
    ./java/java.nix
    ./npm/npm.nix
    ./rust/rust.nix
  ];

  home.packages =with pkgs; [
    # kitty
    # glfw
    # gtk3
    # mesa
    # mesa-utils
    # glxgears
    # 给每个项目创建虚拟专属环境用的，类似devcontainer，配合direnv使用
    # devenv
    devbox
    process-compose
    # direnv
    eza
    tree
    fastfetch
    nixfmt-rfc-style
    nil

    # alsa-utils
    # nautilus
    # wl-clipboard
    # xclip
    # xorg.xeyes
    neovim
    # lazygit
    ripgrep
    zig
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
