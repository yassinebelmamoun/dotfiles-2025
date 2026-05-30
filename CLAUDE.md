# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles managed via manual symlinks — no symlink manager tool (like Stow) is used. Files in this repo are symlinked directly from the home directory:

- `~/.zshrc` → `dotfiles/.zshrc`
- `~/.tmux.conf` → `dotfiles/.tmux.conf`
- `~/.gitconfig` → `dotfiles/.gitconfig`
- `~/.config/starship.toml` → `dotfiles/starship.toml`
- `~/.config/kitty/` → `dotfiles/kitty/`
- `~/.config/nvim/` → `dotfiles/nvim/`

There are no build/lint/test commands — this is a configuration-only repo.

## Structure

| Path | Purpose |
|------|---------|
| `.zshrc` | Zsh shell config via Oh My Zsh |
| `.tmux.conf` | Tmux with TPM plugins, prefix remapped to Ctrl-A |
| `.gitconfig` | Git config with diff-so-fancy, rebase pull, autoSetupRemote |
| `starship.toml` | Starship prompt with kubernetes/aws/terraform modules |
| `kitty/kitty.conf` | Kitty terminal emulator config |
| `nvim/` | Neovim config — see `nvim/CLAUDE.md` for details |

## Key Configuration Details

### Zsh (`.zshrc`)
- Oh My Zsh with plugins: git, brew, python, vi-mode, docker, docker-compose, aws, gh, kubectl, kubectx, macos, vscode
- Starship prompt: `export STARSHIP_CONFIG=~/dotfiles/starship.toml`
- Python via pyenv, Node via nvm, direnv for per-project env vars
- `EDITOR=nvim` for local sessions, `vim` for SSH sessions (detected via `$SSH_CONNECTION`)
- `kube-on` / `kube-off` aliases toggle the kubernetes module in Starship via `SHOW_KUBE`

### Tmux (`.tmux.conf`)
- Prefix: `Ctrl-A` (not `Ctrl-B`)
- Smart pane navigation: `Ctrl-H/J/K/L` works across Vim/Neovim splits and tmux panes via vim-tmux-navigator
- Session management: tmux-sessionx (`<prefix>-O`) with zoxide integration, tmux-resurrect + tmux-continuum for persistence
- Window splits: `|` for vertical, `-` for horizontal
- `<prefix>-M` opens `.tmux.conf` in editor; `<prefix>-R` reloads config

### Starship (`starship.toml`)
- Kubernetes module only shown when `SHOW_KUBE=1` (controlled by `kube-on`/`kube-off` in `.zshrc`)
- Production context renders in yellow, staging in green
- Time displayed in UTC+7

### Neovim (`nvim/`)
See `nvim/CLAUDE.md` and `nvim/README.md` for full architecture. Summary: LazyVim-based, Python + Docker + Terraform workflow. One plugin file per concern in `lua/plugins/`.
