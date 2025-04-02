{ ... }:

{
  home.file.".cargo/config.toml".source = ./config.toml;
  home.file.".rustfmt.toml".source = ./.rustfmt.toml;
}
