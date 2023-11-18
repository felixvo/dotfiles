#zmodload zsh/zprof # top of your .zshrc file
source ~/antigen.zsh
export PATH="/opt/homebrew/bin:$PATH"
# source $(brew --prefix autoenv)/activate.sh

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
antigen theme romkatv/powerlevel10k
antigen bundle "mroth/evalcache"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "jeffreytse/zsh-vi-mode"
#antigen bundle "lukechilds/zsh-nvm"
#antigen bundle "zsh-users/zsh-history-substring-search"
#antigen bundle "spaceship-prompt/spaceship-prompt"
#antigen bundle spaceship-prompt/spaceship-vi-mode@main

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

export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.zsh_history

alias lg=lazygit

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --reverse
  --preview 'echo {}' --preview-window down:10:nohidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

export FZF_COMPLETION_OPTS='--border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}




# bat config
export BAT_THEME="gruvbox-dark"



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
bindkey '^h' edit-command-line


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



alias ctags="`brew --prefix`/bin/ctags"

function aws_profile {
  _profile=$(aws configure list | egrep profile | awk '{print "("$2")"}')
  if [[ "${_profile}" == "(<not)" ]]; then
    echo "(none)"
  else
    echo "${_profile}"
  fi
}

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  bindkey '^h' edit-command-line
}
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zprof # bottom of .zshrc
