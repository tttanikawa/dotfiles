set fish_greeting

# Basic
set -x LC_ALL "en_US.UTF-8"
set -x TERM xterm-256color

# Alias
alias ls 'ls -aG'
alias cp 'cp -i'
# alias rm 'rm -i'
# alias mv 'mv -i'
alias ... 'cd ../../'
alias .... 'cd ../../../'
# alias python 'python3'
# alias pip 'pip3'

# cd & ls
function cd
	builtin cd $argv
	ls
end

function add_path
	set ADDED_PATH $argv[1]
	not contains $ADDED_PATH $PATH
		and set -x PATH $ADDED_PATH $PATH
end

# PATH
add_path /bin
add_path /sbin
add_path /usr/bin
add_path /usr/sbin
add_path /usr/local/bin
# add_path /usr/local/sbin

add_path /Users/ukyo/Library/Python/3.9/bin

# python local
# add_path $HOME/.local/bin

# pyenv
# set -x PYENV_ROOT $HOME/.pyenv
# add_path $PYENV_ROOT/bin
# . (pyenv init - | psub)

# anaconda
# add_path $HOME/opt/anaconda3/bin

# add_path $HOME/.rbenv/bin
# . (rbenv init - | psub)

# powerline
# powerline-daemon -q
# set fish_function_path $fish_function_path $HOME/.local/lib/python3.7/site-packages/powerline/bindings/fish
# powerline-setup

# Qt
# alias qmake '/usr/local/opt/qt5/bin/qmake'

# tmux
# force 256 color
alias tmux 'tmux -2'

# for GNU Parallel
source (which env_parallel.fish)

# pushbullet-bash
alias pushbullet $HOME/work/pushbullet-bash/pushbullet

# NeoVim
set -x XDG_CONFIG_HOME $HOME/.config

# golang
set -x GOPATH $HOME/go
add_path $GOPATH/bin

# nodebrew
add_path $HOME/.nodebrew/current/bin

# rust
add_path $HOME/.cargo/bin

# starship
starship init fish | source

# pyenv
status is-login; and pyenv init --path | source
pyenv init - | source
