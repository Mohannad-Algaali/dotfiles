#!/bin/sh
chosen=$(echo -e "Cancel\nLogout\nSuspend\nRestart\nPoweroff" | rofi -dmenu -i -p "Power:")
case "$chosen" in
    Logout)    i3-msg exit ;;
    Suspend)   systemctl suspend ;;
    Restart)    systemctl reboot ;;
    Poweroff)  systemctl poweroff ;;
esac
