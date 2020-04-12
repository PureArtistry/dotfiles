# handy custom vars
export ARTISTRY=$XDG_DATA_HOME/artistry
export SCRIPTS=$HOME/.local/bin
export MUSIC=$HOME/music
export VIDEO=$HOME/video
export WPG_TEMPLATES=$XDG_CONFIG_HOME/wpg/templates
export DOTFILES=$HOME/working/git/dotfiles
export BSPWM_DESKTOPS_1="1 2 3 4 8 9 10"
export BSPWM_DESKTOPS_2="6"

# home folder cleanup
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_CONFIG_HOME/go
export TASKRC=$XDG_CONFIG_HOME/taskwarrior/taskrc
export TASKDATA=$XDG_CONFIG_HOME/taskwarrior
#export RECOLL_CONFDIR=$XDG_CONFIG_HOME/recoll
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
export CARGO_HOME=$XDG_DATA_HOME/cargo

# brighten up commands
export GREP_COLOR="4;36"
export LESSHISTFILE=$XDG_DATA_HOME/less.hist
export LESSHISTSIZE=1000
export LESS=-iR
export LESS_TERMCAP_mb=$'\E[0;44;37m'	# begin blink
export LESS_TERMCAP_md=$'\E[1;36m'	# begin bold
export LESS_TERMCAP_me=$'\E[0m'		# reset bold/blink
export LESS_TERMCAP_so=$'\E[0;42;37m'	# begin reverse video
export LESS_TERMCAP_se=$'\E[0m'		# reset reverse video
export LESS_TERMCAP_us=$'\E[4;35m'	# begin underline
export LESS_TERMCAP_ue=$'\E[0m'		# reset underline

# standard linuxy stuff
export SXHKD_SHELL=/bin/sh
export TERMINAL=kitty
export TERM=xterm-kitty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=qutebrowser
export FILE="launch_litty ranger"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
export FZF_DEFAULT_COMMAND='find .'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export SUDO_ASKPASS=$HOME/.local/bin/rofi/askpass
