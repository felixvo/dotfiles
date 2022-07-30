#zmodload zsh/zprof # top of your .zshrc file
source ~/antigen.zsh

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=false
export TERM=xterm-256color
if [ $ITERM_SESSION_ID ]; then
    precmd() {
      echo -ne "\033]0;${PWD##*/}\007"
    }
fi


# PLUGINS
#
antigen bundle "mroth/evalcache"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-history-substring-search"
#antigen bundle "lukechilds/zsh-nvm"
antigen bundle "spaceship-prompt/spaceship-prompt"

antigen apply

# END PLUGINS


# nvm() {
#     unset -f nvm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     nvm "$@"
# }

# node() {
#     unset -f node
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     node "$@"
# }
#
# npm() {
#     unset -f npm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     npm "$@"
# }

#bindkey '^k' history-substring-search-up
#bindkey '^j' history-substring-search-down
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down


autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


# Fix bug duplicate on tab
# https://github.com/sindresorhus/pure/issues/300
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# somehow KEYTIMEOUT=0 not working for me
export KEYTIMEOUT=1
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
export EDITOR=nvim
#set -o vi
bindkey -e

# fix vi mode indicator error
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line


## load file in zsh_config
for file in ~/dotfiles/zsh_config/*; do
    source "$file"
done


## load file in zsh_config
LOCAL_ZSH_CONFIG_DIR="$HOME/.zsh_config"
if [ -d "$LOCAL_ZSH_CONFIG_DIR" ]; then
    for file in $LOCAL_ZSH_CONFIG_DIR/*; do
        source "$file"
    done
fi

function csv {
    cat "$@" | column -s, -t | less -#2 -N -S
}

source $(brew --prefix autoenv)/activate.sh

alias ctags="`brew --prefix`/bin/ctags"

function aws_profile {
  _profile=$(aws configure list | egrep profile | awk '{print "("$2")"}')
  if [[ "${_profile}" == "(<not)" ]]; then
    echo "(none)"
  else
    echo "${_profile}"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zprof # bottom of .zshrc
