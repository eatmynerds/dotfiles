{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_network" ''
  if [[ $(tail -n+3 /proc/net/wireless 2>/dev/null) ]]; then
          ssid=$(iwgetid wlp2s0 --raw)
          wireless_icon="  ^c#f7ca88^$ssid^d^"
  elif [[ $(grep "" /sys/class/net/eth0/* 2>/dev/null) ]]; then
          wired_icon=" ^c#f7ca88^LAN^d^"
  fi

  if [[ $(nmcli con show --active | grep -i vpn 2>/dev/null) ]]; then
          vpn_icon="旅 "
  fi

  printf "$vpn_icon$wired_icon$wireless_icon"
''

