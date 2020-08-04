#!/bin/sh
# vim:foldmethod=marker

# prep
fresh_start
touch /tmp/startup.tmp
convert -size 500x500 xc:#222222 /tmp/albumart.png

# standard xinitrc stuff {{{
userresources=$HOME/.Xresources
usermodmap=$XDG_CONFIG_HOME/X11/Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f $userresources ] && xrdb -merge $userresources
[ -f $usermodmap ] && xmodmap $usermodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
	[ -x "$f" ] && . "$f"
	done
	unset f
fi
# }}}
# display setup & daemon startup {{{
prime-offload
systemctl --user import-environment DISPLAY
xrandr --auto
xrandr --dpi 96
xset r rate 300 40
xsetroot -cursor_name left_ptr

mpd
python3 -m http.server 4088 --bind 127.0.0.1 --directory $XDG_DATA_HOME/localweb/startpage &
sxhkd &
aclipexe &
unclutter &
picom -b --config $XDG_CONFIG_HOME/compton/compton.conf
theme_change
# }}}

exec bspwm
