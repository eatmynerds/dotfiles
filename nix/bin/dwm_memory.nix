{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_memory" ''
  icon=""
  printf "$icon $(free -m | awk '/^Mem:/ {print "^c#87af5f^"$3 "mb^d^/" "^c#87afd7^"$2 "mb"}')^d^"
''

