{ writeShellScriptBin, ... }:


writeShellScriptBin "dwm_brightness" ''
  icon=""

  printf "$icon ^c#f7ca88^$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}')%%^d^"
''

