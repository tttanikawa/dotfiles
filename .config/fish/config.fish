set fish_greeting

# Basic
set -x LC_ALL "en_US.UTF-8"
set -x TERM xterm-256color

# Abbreviations
abbr --add ls 'ls -aG'
abbr --add cp 'cp -i'
abbr --add rm 'rm -i'
abbr --add mv 'mv -i'
abbr --add ... 'cd ../../'
abbr --add .... 'cd ../../../'
abbr --add kc kubectl
abbr --add gitl 'git log --graph --decorate --pretty=oneline --abbrev-commit'

# cd & ls
function cd
  builtin cd $argv
  ls
end

# PATH
fish_add_path /bin
fish_add_path /sbin
fish_add_path /usr/bin
fish_add_path /usr/sbin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/Applications/IntelliJ\ IDEA\ Ultimate.app/Contents/MacOS # for idea command

# tmux
alias tmux 'tmux -2'

# Go
set -x GOPATH $HOME/go
fish_add_path $GOPATH/bin

# rust
fish_add_path $HOME/.cargo/bin
source $HOME/.cargo/env.fish

# krew
fish_add_path $HOME/.krew/bin

# starship
starship init fish | source

# fzf
fzf --fish | source

# open git worktree using fzf
function find_git_worktree
  commandline | read -l buffer
  git wt | tail -n +2 | fzf --query "$buffer" --height=20 | awk '{print $(NF-1)}' | read -l selected_worktree
  if test -n "$selected_worktree"
    commandline "git wt $selected_worktree"
    commandline -f execute
  end
  commandline -f repaint
end
bind \cs find_git_worktree

# GPG
set -gx GPG_TTY (tty)

# Testcontainers
set -x TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -x DOCKER_HOST "unix://$HOME/.colima/docker.sock"
set -x TESTCONTAINERS_RYUK_DISABLED true

codex completion fish | source
git wt --init fish | source
direnv hook fish | source
zoxide init fish | source
