{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_uptime" ''
  icon=""
  printf "$icon ^c#d75f5f^$(uptime -p | cut -d " " -f2- | awk '{print $1 substr($2,1,1) " " $3 substr($4,1,1)}')^d^"
''

