{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_cpu_temp" ''
  icon=""

  if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
      temp=$(cat /sys/class/thermal/thermal_zone0/temp)

      temp_c=$(($temp / 1000))

      printf "$icon c^#f7ca88^$temp_c^c#d75f5f^°C^d^"
  fi
''

