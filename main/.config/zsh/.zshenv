## - XDG vars
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DOWNLOAD_DIR=$HOME/stuff/downloads
export XDG_MUSIC_DIR=$HOME/stuff/music
export XDG_PICTURES_DIR=$HOME/stuff/images
export XDG_VIDEOS_DIR=$HOME/stuff/videos

## - handy custom vars
export PRIVATE=$HOME/.local/private
export SCRIPTS=$HOME/.local/bin
export MTV=$XDG_VIDEOS_DIR/music
export GAMES=$XDG_DATA_HOME/games
export DOTFILES=$HOME/stuff/working/dotfiles
export PROJECTS=$HOME/stuff/working/projects
export STARTPAGE=$XDG_DATA_HOME/localweb/startpage
export WALLPAPERS=$XDG_PICTURES_DIR/wallpapers

## - home folder cleanup
[ -f $XDG_RUNTIME_DIR/Xauthority ] || touch $XDG_RUNTIME_DIR/Xauthority
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_DATA_HOME/go
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/.nv
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml

## - theme related
export HIGHLIGHT_STYLE=$XDG_CONFIG_HOME/highlight/flavours.theme
export HIGHLIGHT_TABWIDTH=4
export EXA_ICON_SPACING='2'
export GREP_COLOR='4;36'
export LESSHISTFILE=$XDG_DATA_HOME/less/less.hist
export LESSHISTSIZE=1000
export LESS=-iR
export LESS_TERMCAP_mb=$'\E[0;44;97m'	## - begin blink
export LESS_TERMCAP_md=$'\E[1;36m'	## - begin bold
export LESS_TERMCAP_me=$'\E[0m'		## - reset bold/blink
export LESS_TERMCAP_so=$'\E[0;42;97m'	## - begin reverse video
export LESS_TERMCAP_se=$'\E[0m'		## - reset reverse video
export LESS_TERMCAP_us=$'\E[4;35m'	## - begin underline
export LESS_TERMCAP_ue=$'\E[0m'		## - reset underline

## - standard linuxy stuff
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH=$PATH:$PROJECTS/testing
export TERMINAL=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=qutebrowser
#export SUDO_ASKPASS=$HOME/.local/bin/rofi/askpass

## - other app specific options
export QT_QPA_PLATFORMTHEME='qt5ct'
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
