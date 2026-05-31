#!/usr/bin/env bash

COUNT=$(dunstctl count waiting)

case "$1" in
    --toggle)
        dunstctl set-paused toggle
	sleep 0.1
	kill -38 $(pidof dwmblocks)
	;;
    --status)
        if [ "$COUNT" != "0" ]; then DISABLED=" $COUNT"; fi
        if dunstctl is-paused | grep -q "false"; then
	    echo -e "^c#7aa2f7^ "
        else
	    echo -e "^c#f7768e^  $COUNT"
        fi
        ;;
    *)
        if [ "$COUNT" != "0" ]; then DISABLED=" $COUNT"; fi
        if dunstctl is-paused | grep -q "false"; then
	    echo -e "^c#7aa2f7^ "
        else
	    echo "^c#f7768e^  $COUNT"
        fi
        ;;
esac
