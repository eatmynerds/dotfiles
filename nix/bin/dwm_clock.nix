{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_clock" ''
  icon=""
  printf "$icon ^c#f7ca88^$(date '+%I:%M %p')^d^"
''

