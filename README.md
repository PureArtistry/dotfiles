### these files are wpg templates, use wpg -ta /path/to/file to add:
```
~/.config/dunst/dunstrc
~/.config/dunst/dunst.mini
~/.config/kitty/kitty_colors.conf
~/.config/qutebrowser/config.py
~/.config/rofi/config.rasi
~/.config/rofi/config-mini.rasi
~/.local/share/localweb/startpage/index.html
~/.local/share/localweb/startpage/script/script.js
~/.local/share/localweb/startpage/style/style.css
~/.local/share/Ripcord/custom_theme.json
```
the files in the .config/wpg/templates folder are backups, don't copy them


### the /etc folder

#### meme tty login
`sudo cp /path/drake_navy_issue /etc/issue`

#### sxiv
I use a custom sxiv build, my config.h if you want the same settings

#### ranger
currently ranger runs like shit in kitty when previewing stuff, these files are from a testing branch of ranger that help somewhat (less lag, more visual glitches)

#### polybar
I ultimately didn't find having a bar too useful and prefer the extra screen space, leaving my old config here

---
##### misc notes
a list of all my packages can be found in /etc so you have an idea for dependencies

old i3 config can still be found on a different branch, most of the stuff in it has been transfered to this (some stuff improved).
