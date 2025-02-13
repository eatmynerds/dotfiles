{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ];

  home.file.".config/wezterm" = {
    source = ./wezterm;
    recursive = true;
  };
}
