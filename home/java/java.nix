{ pkgs, ... }:

{

  #   home.packages = with pkgs; [ maven ];

  #   programs.java = {
  #     enable = true;
  #     package = pkgs.jdk17;
  #   };
  # programs.sbt.enable = true;

  home.file.".m2/settings.xml".source = ./settings.xml;
}
