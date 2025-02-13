{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_volume" ''
  icon=" "
  vol=$(pamixer --get-volume)
    
  printf "%s ^c#f7ca88^%s^d^" "$icon" "$vol"
''
