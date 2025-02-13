{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];

  home.file.".config/cava" = {
    source = ./cava;
    recursive = true;
  };
}
