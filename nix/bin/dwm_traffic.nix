{ writeShellScriptBin, ... }:

writeShellScriptBin "dwm_traffic" '' 
cache_path=~/.cache/.traffic

old_rx=$(head -n 1 $cache_path)
old_tx=$(tail -1 $cache_path)

printf "0\n0\n" > $cache_path

NETWORK_INTERFACE=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')

new_rx=`</sys/class/net/$NETWORK_INTERFACE/statistics/rx_bytes`
new_tx=`</sys/class/net/$NETWORK_INTERFACE/statistics/tx_bytes`

sed -i "1s/^.*$/$new_rx/" $cache_path
sed -i "2s/^.*$/$new_tx/" $cache_path

tx_bytes=`expr $new_tx - $old_tx`
rx_bytes=`expr $new_rx - $old_rx`
tx_kbs=`expr $tx_bytes / 1024`
rx_kbs=`expr $rx_bytes / 1024`

printf " ^c#87af5f^$rx_kbs"kb^d^"  ^c#87afd7^$tx_kbs"kb^d^""
''

