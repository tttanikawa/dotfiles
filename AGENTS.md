# Repository Guidelines

## Project Structure & Module Organization

This repository is a macOS-oriented dotfiles collection. Root-level files configure common tools: `.zshrc`, `.tmux.conf`, `.gitconfig`, `.gitignore_global`, `Brewfile`, and `Makefile`. App-specific configuration lives under hidden directories that mirror the target home layout, such as `.config/fish/`, `.config/wezterm/`, `.config/ghostty/`, `.config/karabiner/`, `.config/mise/`, `.config/sheldon/`, `.claude/`, and `.hammerspoon/`.

There is no separate source, test, or asset tree. Treat each config file as the source of truth for its tool. Keep new dotfiles in the same path they should occupy under `$HOME`, then add a matching `Makefile` target if they need symlink installation.

## Build, Test, and Development Commands

- `make`: installs all dotfiles by creating directories and symlinks in `$HOME`.
- `make zsh`, `make fish`, `make wezterm`, etc.: installs one tool’s config.
- `brew bundle check`: verifies whether packages in `Brewfile` are installed.
- `brew bundle`: installs missing Homebrew formulae, casks, and taps from `Brewfile`.

Run `make` carefully because it overwrites destination symlinks via `ln -sf`.

## Coding Style & Naming Conventions

Match each config language’s style. Use two spaces for shell and Fish blocks, four spaces in Lua files where already present, and preserve TOML/JSON formatting. Keep shell functions lowercase with hyphens or underscores, for example `ghq-fzf` and `find_git_worktree`. Prefer guarded startup hooks when a tool may be absent, for example `if test -f ...` in Fish or `[[ -s ... ]]` in Zsh.

## Testing Guidelines

No automated test suite is currently defined. Validate changes with tool-specific checks before committing:

- `zsh -n .zshrc` for Zsh syntax.
- `fish --no-config --no-execute .config/fish/config.fish` for Fish syntax.
- `luac -p .config/wezterm/wezterm.lua` where Lua is available.
- `make <target>` to confirm symlink installation for the changed tool.

For Hammerspoon, Karabiner, terminal emulators, and prompt plugins, reload the app locally and verify behavior manually.

## Commit & Pull Request Guidelines

Include concise descriptions such as `Source cargo env only when present`. Prefer a specific subject under 72 characters, for example `Guard zsh cargo env loading`.

Pull requests should include a brief description, affected tools, validation commands run, and any manual reload steps. Include screenshots only for visible terminal, prompt, or window-manager changes.

## Security & Configuration Tips

Do not commit secrets, machine-specific tokens, private keys, or local credential files. Keep host-specific paths guarded when possible so fresh machines can source shell configs without failing.
