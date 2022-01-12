#!/bin/sh

if [ -n "$1" ]; then
    flavours generate dark "$@"
    exit $?
fi

update_startpage() {
    j=$(shuf -i1-1000000 -n1)
    sed -i "s/ver=.*\"/ver=${j}\"/g" $STARTPAGE/index.html
}

flavours apply generated
update_startpage &
xrdb -merge $XDG_CONFIG_HOME/X11/xresources &
pgrep qutebrowser 1>/dev/null 2>&1 && qutebrowser :config-source 1>/dev/null 2>&1 &
return 0
