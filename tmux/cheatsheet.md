# Tmux Cheatsheet

Prefix: **`C-a`** (Ctrl+A)

---

## Meta

| Keys         | Action                         |
| ------------ | ------------------------------ |
| `prefix + r` | Reload config                  |
| `prefix + M` | Open `.tmux.conf` in nvim      |
| `prefix + ?` | List all key bindings          |
| `prefix + :` | Open command prompt            |
| `prefix + l` | Clear screen (C-l passthrough) |

---

## Sessions

| Keys         | Action                                       |
| ------------ | -------------------------------------------- |
| `prefix + $` | Rename current session                       |
| `prefix + d` | Detach from session                          |
| `prefix + s` | List sessions (tree view, switch with Enter) |
| `prefix + O` | SessionX: fuzzy session + zoxide dir picker  |

**SessionX picker controls:**

| Keys     | Action                               |
| -------- | ------------------------------------ |
| `Enter`  | Switch to session or create from dir |
| `X`      | Kill selected session                |
| `R`      | Rename selected session              |
| `Tab`    | Toggle preview                       |
| `Ctrl-d` | Scroll preview down                  |
| `Ctrl-u` | Scroll preview up                    |

**CLI:**

```sh
tmux new -s <name>         # new session
tmux attach -t <name>      # attach
tmux ls                    # list sessions
tmux kill-session -t <name>
```

---

## Windows

| Keys           | Action                   |
| -------------- | ------------------------ |
| `prefix + c`   | New window               |
| `prefix + ,`   | Rename window            |
| `prefix + &`   | Kill window              |
| `prefix + n`   | Next window              |
| `prefix + p`   | Previous window          |
| `prefix + 1-9` | Jump to window by number |
| `prefix + w`   | Window list picker       |

Windows auto-renumber when one is closed.

---

## Panes

| Keys                    | Action                                       |
| ----------------------- | -------------------------------------------- |
| `prefix + \|`           | Split pane right (vertical)                  |
| `prefix + -`            | Split pane down (horizontal)                 |
| `C-h / C-j / C-k / C-l` | Navigate panes — vim-aware, **no prefix**    |
| `C-\`                   | Last pane — vim-aware, **no prefix**         |
| `prefix + x`            | Kill pane                                    |
| `prefix + z`            | Zoom / unzoom pane (toggle fullscreen)       |
| `prefix + H/J/K/L`      | Resize pane (repeatable — hold after prefix) |
| `prefix + {`            | Swap pane with previous                      |
| `prefix + }`            | Swap pane with next                          |
| `prefix + q`            | Show pane numbers (press number to jump)     |
| Mouse drag              | Resize pane borders                          |

---

## Copy Mode (vi)

| Keys            | Action                                                  |
| --------------- | ------------------------------------------------------- |
| `prefix + [`    | Enter copy mode                                         |
| `v`             | Begin selection                                         |
| `V`             | Select whole line                                       |
| `y`             | Copy selection + exit (also copies to system clipboard) |
| `Y`             | Copy current line to system clipboard (tmux-yank)       |
| `q` or `Escape` | Exit copy mode                                          |
| `prefix + ]`    | Paste buffer                                            |
| `/`             | Search forward                                          |
| `?`             | Search backward                                         |
| `n / N`         | Next / previous search match                            |
| `g / G`         | Jump to top / bottom                                    |
| `C-u / C-d`     | Scroll half page up / down                              |

---

## Resurrect & Continuum

Sessions are auto-saved every 15 minutes and restored on tmux start.

| Keys           | Action                   |
| -------------- | ------------------------ |
| `prefix + C-s` | Save session manually    |
| `prefix + C-r` | Restore session manually |

---

## Plugins: Install & Update

| Keys             | Action                               |
| ---------------- | ------------------------------------ |
| `prefix + I`     | Install new plugins listed in config |
| `prefix + U`     | Update all plugins                   |
| `prefix + Alt+u` | Remove plugins not in config         |
