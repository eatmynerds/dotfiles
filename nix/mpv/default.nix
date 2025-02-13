{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mpv
  ];

  home.file.".config/mpv" = {
    source = ./mpv;
    recursive = true;
  };
}
