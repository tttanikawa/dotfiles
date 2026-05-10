typeset -U path PATH
path=(
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
  $HOME/.cargo/bin
  $HOME/.krew/bin
  $HOME/.local/bin
  $HOME/go/bin
)

# Basic configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt inc_append_history
setopt auto_pushd
setopt auto_cd
autoload -Uz compinit
compinit

# Export
export GOPATH="$HOME/go"
export GPG_TTY="$TTY"

# Automatically run ls after cd
function chpwd() {
    emulate -L zsh
    ls -aG
}

# Search history with fzf
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey "^r" fzf-select-history

# Search repositories managed by ghq
function ghq-fzf() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N ghq-fzf
bindkey "^g" ghq-fzf

# Enable sheldon plugin manager
eval "$(sheldon source)"

# zsh-abbr configuration
export ABBR_QUIETER=1
abbr -S --force ls="ls -aG"
abbr -S --force cp="cp -i"
abbr -S --force rm="rm -i"
abbr -S --force mv="mv -i"
abbr -S --force grep="grep --color=auto"
abbr -S ...="cd ../../"
abbr -S ....="cd ../../../"
abbr -S kc="kubectl"
abbr -S gitl="git log --graph --decorate --pretty=oneline --abbrev-commit"

# zsh-history-substring-search configuration
bindkey "^[[A" history-substring-search-up # or "\eOA"
bindkey "^[[B" history-substring-search-down # or "\eOB"
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# cargo
source "$HOME/.cargo/env"
fpath=(~/.zsh/completions $fpath)

# mise
eval "$(mise activate zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. "$HOME/.local/bin/env"
