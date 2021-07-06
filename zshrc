#zmodload zsh/zprof # top of your .zshrc file

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
#zplug "jeffreytse/zsh-vi-mode"
#
## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

# # Load plugins
# fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/plugins/k/k.plugin.zsh

source ~/dotfiles/zsh_config/spaceship

# Set up the prompt
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

#prompt spaceship

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
autoload -U compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


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
#bindkey -v

# fix vi mode indicator error
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#autoload -U edit-command-line
#zle -N edit-command-line
#bindkey '\033' edit-command-line

ctags=/usr/local/bin/ctags

## load file in zsh_config
for file in ~/dotfiles/zsh_config/*; do
    source "$file"
done

## load local config in .localzshrc*
for file in ~/.localzshrc*; do
    source "$file"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zprof # bottom of .zshrc

function csv {
    cat "$@" | column -s, -t | less -#2 -N -S
}
