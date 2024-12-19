#!/bin/bash
effects=("grow" "wave" "any" "fade")
random_index=$(( RANDOM % ${#effects[@]} )) 
img=$(sxiv -to ~/Pictures | awk -F'/' '{print $NF}')
swww img -t ${effects[random_index]} ~/Pictures/$img
wal -n -i ~/Pictures/$img
sh ~/.config/hypr/scripts/changecolorsrofi.sh
sh ~/.config/hypr/scripts/changecolorspowermenu.sh
sh ~/.config/hypr/scripts/changecolorsspotify.sh
wpg -a ~/Pictures/$img
wpg -s ~/Pictures/$img
spicetify refresh
pywal-discord
