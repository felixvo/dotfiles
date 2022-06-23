# zmodload zsh/zprof # top of your .zshrc file

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=false
export TERM=xterm-256color


# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
#zplug "lukechilds/zsh-nvm"
zplug "mroth/evalcache"
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

nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}
 
node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}
 
npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

#bindkey '^k' history-substring-search-up
#bindkey '^j' history-substring-search-down
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

#prompt spaceship

autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# autoload -U compinit
#
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C

prompt spaceship


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
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

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


function csv {
    cat "$@" | column -s, -t | less -#2 -N -S
}

eval "$(rbenv init -)"
#source $(brew --prefix autoenv)/activate.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
alias ctags="`brew --prefix`/bin/ctags"


function aws_profile {
  _profile=$(aws configure list | egrep profile | awk '{print "("$2")"}')
  if [[ "${_profile}" == "(<not)" ]]; then
    echo "(none)"
  else
    echo "${_profile}"
  fi
}

alias tf="terraform"
export PATH="/usr/local/opt/maven@3.5/bin:$PATH"

alias kd='kubectl -n data-pipeline'
alias kdi='kubectl -n data-ingestion'
alias kds='kubectl -n datastore'
alias km='kubectl -n microservices'
alias kl='kubectl -n logging'
alias kq='kubectl -n queue'
alias ksp='kubectl -n spiders'
alias kbw='kubectx -'

source <(kubectl completion zsh)

export PATH=~/projects:$PATH
export GOPRIVATE="gitlab.com/intelllex"
export GOSUMDB=off
export GOPATH="/Users/felix/go"

alias dkswagger="docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"


export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Users/felix/.local/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/terraform@0.12/bin:$PATH"

# zprof # bottom of .zshrc
