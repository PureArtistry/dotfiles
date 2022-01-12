#!/bin/sh

pgrep picom 2>/dev/null && killall -q picom
sleep 0.1
picom -b --experimental-backends --config $XDG_CONFIG_HOME/compton/compton.conf
return 0
