{ pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "ff";
  home.homeDirectory = "/home/ff";

  imports = [
    # ../../sys-conf/hyprland/hyprland.nix
    # ../../sys-conf/hyprland/dunst.nix
    # ../../sys-conf/hyprland/waybar.nix
    # ./sys-conf/hyprland/wezterm.nix
    # ../../sys-conf/hyprland/kitty.nix

    ./bash/bash.nix
    ./java/java.nix
    ./npm/npm.nix
    ./rust/rust.nix
  ];

  nixpkgs = {
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      # allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    # kitty
    # glfw
    # gtk3
    # mesa
    # mesa-utils
    # glxgears
    # 给每个项目创建虚拟专属环境用的，类似devcontainer，配合direnv使用
    devenv
    # direnv
    eza
    tree
    fastfetch
    nixfmt-rfc-style
    nil

    alsa-utils
    # nautilus
    # wl-clipboard
    # xclip
    # xorg.xeyes
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # vimAlias = true;
    viAlias = true;
    # extraLuaPackages = ps: [ ps.magick ];
    # extraPackages = with pkgs; [ imagemagick ];
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
