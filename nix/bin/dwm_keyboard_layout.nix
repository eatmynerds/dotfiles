{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_keyboard_layout" ''
  k_layout_icon=
  k_layout=$(setxkbmap -query | grep layout | awk '{print $NF}')

  printf "$k_layout_icon ^c#f7ca88^$k_layout^d^"
''

