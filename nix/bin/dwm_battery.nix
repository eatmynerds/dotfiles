{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_battery" ''
  bat_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_status=$(cat /sys/class/power_supply/BAT0/status)
  
  if [ "$bat_status" == "Charging" ]; then
    battery_icon=""
  elif [ "$bat_capacity" -lt 15 ]; then
	  battery_icon=" "
  elif [ "$bat_capacity" -ge 15 ] && [ "$bat_capacity" -lt 35 ]; then
	  battery_icon=" "
  elif [ "$bat_capacity" -ge 35 ] && [ "$bat_capacity" -lt 60 ]; then
	  battery_icon=" "
  elif [ "$bat_capacity" -ge 60 ] && [ "$bat_capacity" -lt 90 ]; then
	  battery_icon=" "
  else
	  battery_icon=" "
  fi
  
  printf "$battery_icon^c#f7ca88^$bat_capacity%%^d^"
''
