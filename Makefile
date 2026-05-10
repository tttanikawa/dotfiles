.PHONY: all alacritty claude fish ghostty git hammerspoon karabiner mise sheldon starship tmux wezterm zsh
all: alacritty claude fish ghostty git hammerspoon karabiner mise sheldon starship tmux wezterm zsh

alacritty:
	mkdir -p ${HOME}/.config/alacritty
	ln -sf ${PWD}/.config/alacritty/alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

claude:
	mkdir -p ${HOME}/.claude
	ln -sf ${PWD}/.claude/settings.json ${HOME}/.claude/settings.json
	ln -sf ${PWD}/.claude/statusline.py ${HOME}/.claude/statusline.py
	ln -sf ${PWD}/.claude/statusline.sh ${HOME}/.claude/statusline.sh

fish:
	mkdir -p ${HOME}/.config/fish/functions
	ln -sf ${PWD}/.config/fish/config.fish ${HOME}/.config/fish/config.fish
	ln -sf ${PWD}/.config/fish/fish_plugins ${HOME}/.config/fish/fish_plugins
	ln -sf ${PWD}/.config/fish/functions/envsource.fish ${HOME}/.config/fish/functions/envsource.fish
	
ghostty:
	mkdir -p ${HOME}/.config/ghostty
	ln -sf ${PWD}/.config/ghostty/config ${HOME}/.config/ghostty/config

git:
	ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -sf ${PWD}/.gitignore_global ${HOME}/.gitignore_global

hammerspoon:
	mkdir -p ${HOME}/.hammerspoon
	ln -sf ${PWD}/.hammerspoon/init.lua ${HOME}/.hammerspoon/init.lua

karabiner:
	mkdir -p ${HOME}/.config/karabiner
	ln -sf ${PWD}/.config/karabiner/karabiner.json ${HOME}/.config/karabiner/karabiner.json

mise:
	mkdir -p ${HOME}/.config/mise
	ln -sf ${PWD}/.config/mise/config.toml ${HOME}/.config/mise/config.toml

sheldon:
	mkdir -p ${HOME}/.config/sheldon
	ln -sf ${PWD}/.config/sheldon/plugins.toml ${HOME}/.config/sheldon/plugins.toml

starship:
	mkdir -p ${HOME}/.config
	ln -sf ${PWD}/.config/starship.toml ${HOME}/.config/starship.toml

tmux:
	ln -sf ${PWD}/.tmux.conf ${HOME}/.tmux.conf

wezterm:
	mkdir -p ${HOME}/.config/wezterm
	ln -sf ${PWD}/.config/wezterm/wezterm.lua ${HOME}/.config/wezterm/wezterm.lua

zsh:
	ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
