#!/bin/sh
# vim:foldmethod=marker

# prep {{{

[ -f /tmp/albumart.png ] && rm -f /tmp/albumart.png
[ -f /tmp/my_companion_id ] && rm -f /tmp/my_companion_id
[ -f /tmp/my_playlist_id ] && rm -f /tmp/my_playlist_id
[ -f /tmp/big_cat_id ] && rm -f /tmp/big_cat_id
[ -f /tmp/pretty_colours_id ] && rm -f /tmp/pretty_colours_id
[ -f /tmp/art_show_id ] && rm -f /tmp/art_show_id
[ -f /tmp/fancy_writing_id ] && rm -f /tmp/fancy_writing_id
[ -f /tmp/ace_temp_buffer ] && rm -f /tmp/ace_temp_buffer
[ -d /tmp/startup.lock ] && rm -rf /tmp/startup.lock
[ -d /tmp/the.lock ] && rm -rf /tmp/the.lock
[ -d /tmp/kitty_control ] && rm -rf /tmp/kitty_control/* || mkdir /tmp/kitty_control

h_name=$(head -n 1 /etc/hostname)
[ -f $XDG_CACHE_HOME/$h_name.state ] || touch $XDG_CACHE_HOME/$h_name.state
echo "startup" > $XDG_CACHE_HOME/$h_name.state

# }}}

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
theme_change ellie.jpg

# }}}

exec bspwm
