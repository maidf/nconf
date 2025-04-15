{ ... }:

{
  programs.nushell = {
    enable = true;
    configFile.source = ./config/config.nu;
    envFile.source = ./config/env.nu;
    loginFile.source = ./config/login.nu;
  };

  home.file.".config/nushell" = {
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
