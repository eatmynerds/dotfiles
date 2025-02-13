{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_kernel" ''
  icon=""
  kernel_v="$(uname -r)"
  kernel_v="''${kernel_v%%-*}"
  # Print the icon and kernel version
  printf "%s ^c#f7ca88^%s^d^" "$icon" "$kernel_v"
''
