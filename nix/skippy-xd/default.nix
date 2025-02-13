{ pkgs, ... }:

{
  home.packages = with pkgs; [
    skippy-xd
  ];

  home.file.".config/skippy-xd" = {
    source = ./skippy-xd;
    recursive = true;
  };
}
