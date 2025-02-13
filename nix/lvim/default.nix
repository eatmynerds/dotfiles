{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lunarvim
  ];

  home.file.".config/lvim" = {
    source = ./lvim;
    recursive = true;
  };
}
