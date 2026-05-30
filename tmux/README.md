# tmux

Tmux configuration using [TPM](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager).

- Prefix remapped to `Ctrl-A`
- Vi copy mode with system clipboard (tmux-yank)
- Vim-aware pane navigation via `C-h/j/k/l` (no prefix)
- Fuzzy session switching with zoxide via tmux-sessionx
- Auto-save/restore sessions via tmux-resurrect + tmux-continuum

## Bootstrap (new machine)

Plugins are tracked as git submodules — no separate install step needed.

```sh
# 1. Pull all plugin submodules
git submodule update --init --recursive

# 2. Symlink config
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# 3. Symlink plugins dir
mkdir -p ~/.tmux && ln -s ~/dotfiles/tmux/plugins ~/.tmux/plugins
```

## Updating plugins

| Method          | How                                                                                                |
| --------------- | -------------------------------------------------------------------------------------------------- |
| Single plugin   | `cd ~/dotfiles/tmux/plugins/<name> && git pull`, then commit the pointer bump                      |
| All plugins     | `prefix + U` inside tmux (runs `git pull` in each submodule)                                       |
| Add a plugin    | `git submodule add <url> tmux/plugins/<name>`, add to `.tmux.conf`                                 |
| Remove a plugin | `git submodule deinit tmux/plugins/<name> && git rm tmux/plugins/<name>`, remove from `.tmux.conf` |

## TPM key bindings

| Action                | Keys             |
| --------------------- | ---------------- |
| Install new plugins   | `prefix + I`     |
| Update all plugins    | `prefix + U`     |
| Remove unused plugins | `prefix + Alt+u` |

## Plugins

| Plugin         | Purpose                              |
| -------------- | ------------------------------------ |
| tpm            | Plugin manager                       |
| tmux-themepack | Powerline cyan theme                 |
| tmux-sensible  | Sane defaults                        |
| tmux-sessionx  | Fuzzy session/dir picker with zoxide |
| tmux-resurrect | Manual save/restore sessions         |
| tmux-continuum | Auto-save sessions every 15 min      |
| tmux-yank      | System clipboard in copy mode        |

## See also

[cheatsheet.md](./cheatsheet.md) — key bindings reference
