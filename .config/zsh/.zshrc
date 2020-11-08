[[ $- != *i* ]] && return

# prompt {{{

autoload -U colors && colors
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PROMPT_ORDER=(
    exec_time     # Execution time
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubectl       # Kubectl context section
    terraform     # Terraform workspace section
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=()
SPACESHIP_CHAR_SYMBOL=" "
SPACESHIP_EXEC_TIME_ELAPSED=0
SPACESHIP_DIR_TRUNC_PREFIX=".../"
SPACESHIP_BATTERY_THRESHOLD=90
SPACESHIP_BATTERY_SYMBOL_CHARGING=''
SPACESHIP_BATTERY_SYMBOL_DISCHARGING=''
SPACESHIP_BATTERY_SYMBOL_FULL=''

# }}}
# main {{{

HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS EXTENDED_HISTORY INC_APPEND_HISTORY_TIME autocd beep extendedglob nomatch aliases correctall #COMPLETE_ALIASES
unsetopt notify

bindkey -e

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zmodload zsh/complist
compinit
_comp_options+=(globdots)

autoload bashcompinit
bashcompinit
_get_comp_words_by_ref() { :; }
compopt() { :; }
_filedir() { :; }
# eval "$(beet completion)" # <- only useful when sorting music collection

kitty + complete setup zsh | source /dev/stdin

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

source $ARTISTRY/alias_list

# }}}
# keybinds {{{

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start {
          echoti smkx
    }
    function zle_application_mode_stop {
          echoti rmkx
    }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

bindkey '^ ' autosuggest-execute
bindkey "^${key[Down]}" autosuggest-clear

# }}}
# highlighting {{{

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=15,bg=1,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=14,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=14'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=14,underline'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=5'
ZSH_HIGHLIGHT_STYLES[function]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=15,bg=3'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=15,bg=5,bold'
# ZSH_HIGHLIGHT_STYLES[hashed-command]=''
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=15,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=15,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=5,bold'
# ZSH_HIGHLIGHT_STYLES[path_prefix]=''
# ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=''
ZSH_HIGHLIGHT_STYLES[globbing]='bg=4,fg=15'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=12'
# ZSH_HIGHLIGHT_STYLES[command-substitution]=''
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=1,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=9,bold'
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=''
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=1,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=9,bold'
# ZSH_HIGHLIGHT_STYLES[process-substitution]=''
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=11,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=10'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=14'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='bg=6,fg=15'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=14,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=6'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='bg=6,fg=15'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=14'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='bg=6,fg=15'
# ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=''
# ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]=''
# ZSH_HIGHLIGHT_STYLES[rc-quote]=''
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=''
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=''
# ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=''
ZSH_HIGHLIGHT_STYLES[assign]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=7,bg=8'
# ZSH_HIGHLIGHT_STYLES[named-fd]=''
# ZSH_HIGHLIGHT_STYLES[numeric-fd]=''
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10'
ZSH_HIGHLIGHT_STYLES[default]='fg=15'
# ZSH_HIGHLIGHT_STYLES[bracket-error]=''
# ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=''
# ZSH_HIGHLIGHT_STYLES[bracket-level-N]='' # <- you can define multiple levels

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# }}}

[ -f /tmp/startup.tmp ] && neofetch && rm -f /tmp/startup.tmp

# vim:foldmethod=marker
