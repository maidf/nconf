{ ... }:

{
  programs.fish.enable = true;

  home.file.".config/fish" = {
    source = ./config;
    recursive = true;
  };

  # home.file.".config/nushell/pnpm" = {
  #   source = ./config/pnpm;
  #   recursive = true;
  # };

  # home.file.".config/nushell/devenv" = {
  #   source = ./config/devenv;
  #   recursive = true;
  # };
}
