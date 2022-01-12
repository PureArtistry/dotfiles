printf '[H[2J[0m'
fresh_start.sh

local TTY_CHECK=$(tty)
function {
	SOUND_CHECK() {
		local MUTED_STARTUP
		local SINK_ACTIVE=false
		while [ $SINK_ACTIVE = false ]; do
			MUTED_STARTUP="$(pactl get-sink-mute @DEFAULT_SINK@)" 2>/dev/null
			[ -z "$MUTED_STARTUP" ] || SINK_ACTIVE=true
		done
		MUTED_STARTUP=${MUTED_STARTUP##* }
		[ $MUTED_STARTUP = 'no' ] && pactl set-sink-mute @DEFAULT_SINK@ 0
	}
	if [ $TTY_CHECK = '/dev/tty1' ] || [ $TTY_CHECK = '/dev/tty2' ]; then
		mpd 2>/dev/null
		SOUND_CHECK
	fi
}
if [ $TTY_CHECK = '/dev/tty1' ] && ! pgrep -x awesome >/dev/null; then
	unset TTY_CHECK
	exec startx $XDG_CONFIG_HOME/X11/xinitrc
else
	unset TTY_CHECK
fi
