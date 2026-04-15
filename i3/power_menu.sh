#!/bin/sh

# Define the options with Nerd Font icons
#   (Poweroff), 󰜉 (Restart), 󰒲 (Suspend), 󰈆 (Logout), 󰜺 (Cancel)
chosen=$(echo -e "󰜺 Cancel\n󰈆 Logout\n󰒲 Suspend\n󰜉 Restart\n Poweroff" | rofi -dmenu -i -theme ~/.config/i3/power_menu.rasi -p "Power:")

case "$chosen" in
    *Logout)   i3-msg exit ;;
    *Suspend)  systemctl suspend ;;
    *Restart)  systemctl reboot ;;
    *Poweroff) systemctl poweroff ;;
esac
