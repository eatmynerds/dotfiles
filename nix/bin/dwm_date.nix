{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_date" ''
  icon=""
  printf "$icon ^c#f7ca88^$(date '+%a, %B %d')^d^"
''

