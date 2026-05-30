# Neovim Cheatsheet

> `<leader>` = `Space` · `<localleader>` = `\`
> Open this file: `<leader>hc`

---

## Modes

| Key                 | Mode                         |
| ------------------- | ---------------------------- |
| `i` / `a`           | Insert before / after cursor |
| `I` / `A`           | Insert at line start / end   |
| `o` / `O`           | New line below / above       |
| `v` / `V` / `<C-v>` | Visual char / line / block   |
| `<Esc>`             | Back to Normal               |

---

## Navigation

| Key                | Action                                  |
| ------------------ | --------------------------------------- |
| `h j k l`          | Left / down / up / right                |
| `w` / `b` / `e`    | Word forward / back / end               |
| `0` / `^` / `$`    | Line start / first non-blank / end      |
| `gg` / `G`         | File start / end                        |
| `{n}G`             | Go to line n                            |
| `<C-d>` / `<C-u>`  | Half page down / up                     |
| `zz` / `zt` / `zb` | Center / top / bottom cursor            |
| `%`                | Jump to matching bracket                |
| `*` / `#`          | Search word under cursor forward / back |
| `n` / `N`          | Next / prev search match                |
| `<C-o>` / `<C-i>`  | Jump back / forward in jump list        |
| `s`                | Flash jump anywhere                     |
| `S`                | Flash treesitter jump                   |

---

## Windows & Splits

| Key           | Action                                              |
| ------------- | --------------------------------------------------- |
| `<C-h/j/k/l>` | Move to window left/down/up/right (also tmux panes) |
| `<leader>-`   | Split below                                         |
| `<leader>\|`  | Split right                                         |
| `<leader>wd`  | Close window                                        |
| `<leader>wm`  | Toggle maximize window                              |
| `<C-w>=`      | Equalize window sizes                               |

---

## Buffers & Tabs

| Key               | Action                 |
| ----------------- | ---------------------- |
| `<S-h>` / `<S-l>` | Prev / next buffer     |
| `[b` / `]b`       | Prev / next buffer     |
| `<leader>bb`      | Switch to other buffer |
| `<leader>bd`      | Delete buffer          |
| `<leader>bD`      | Force delete buffer    |

---

## File Explorer (neo-tree)

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>e`  | Toggle explorer (left)  |
| `<leader>E`  | Toggle explorer (float) |
| `<leader>fe` | Explorer (root)         |
| `<leader>fE` | Explorer (cwd)          |

---

## Search & Find (Snacks)

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>ff` | Find files (root)        |
| `<leader>fF` | Find files (cwd)         |
| `<leader>fr` | Recent files             |
| `<leader>fb` | Buffers                  |
| `<leader>fc` | Find config file         |
| `<leader>/`  | Grep (root)              |
| `<leader>sg` | Grep (root)              |
| `<leader>sG` | Grep (cwd)               |
| `<leader>sw` | Search word under cursor |
| `<leader>ss` | Go to symbol (buffer)    |
| `<leader>sS` | Go to symbol (workspace) |
| `<leader>sd` | Diagnostics (workspace)  |
| `<leader>sD` | Diagnostics (buffer)     |
| `<leader>sk` | Search keymaps           |
| `<leader>sh` | Search help pages        |
| `<leader>sq` | Quickfix list            |

---

## LSP

| Key          | Action                 |
| ------------ | ---------------------- |
| `gd`         | Go to definition       |
| `gD`         | Go to declaration      |
| `gr`         | References             |
| `gI`         | Go to implementation   |
| `gy`         | Go to type definition  |
| `K`          | Hover documentation    |
| `gK`         | Signature help         |
| `<leader>ca` | Code action            |
| `<leader>cA` | Source action          |
| `<leader>cr` | Rename symbol          |
| `<leader>cf` | Format                 |
| `<leader>cd` | Line diagnostics       |
| `[d` / `]d`  | Prev / next diagnostic |
| `[e` / `]e`  | Prev / next error      |
| `[w` / `]w`  | Prev / next warning    |

---

## Git (Gitsigns + LazyGit + Snacks)

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>gg`  | LazyGit (root)         |
| `<leader>gG`  | LazyGit (cwd)          |
| `<leader>gs`  | Git status             |
| `<leader>gl`  | Git log                |
| `<leader>gf`  | Git log (current file) |
| `<leader>gb`  | Blame line             |
| `<leader>gB`  | Browse on GitHub       |
| `<leader>gd`  | Diff this              |
| `]h` / `[h`   | Next / prev hunk       |
| `<leader>ghs` | Stage hunk             |
| `<leader>ghr` | Reset hunk             |
| `<leader>ghS` | Stage buffer           |
| `<leader>ghu` | Undo stage hunk        |
| `<leader>ghR` | Reset buffer           |
| `<leader>ghp` | Preview hunk inline    |
| `<leader>ghb` | Blame line (full)      |

---

## Testing — Neotest (`<leader>t`)

Runs pytest locally via `.venv/bin/python`. For container tests use `<leader>Dt`.

| Key          | Action               |
| ------------ | -------------------- |
| `<leader>tt` | Run nearest test     |
| `<leader>tT` | Run tests in file    |
| `<leader>ta` | Run all tests        |
| `<leader>tl` | Run last test        |
| `<leader>ts` | Toggle summary panel |
| `<leader>to` | Show output          |
| `<leader>tO` | Toggle output panel  |
| `<leader>tS` | Stop                 |

---

## Debugging — DAP (`<leader>d`)

Attach to debugpy running inside Docker on port 5678 (primary) or 5679 (secondary).

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>da` | Run / attach (shows picker) |
| `<leader>db` | Toggle breakpoint           |
| `<leader>dB` | Conditional breakpoint      |
| `<leader>dc` | Continue                    |
| `<leader>dC` | Run to cursor               |
| `<leader>di` | Step into                   |
| `<leader>do` | Step out                    |
| `<leader>dO` | Step over                   |
| `<leader>dp` | Pause                       |
| `<leader>dr` | Toggle REPL                 |
| `<leader>dt` | Terminate                   |
| `<leader>dw` | Widgets                     |

---

## Docker — Compose (`<leader>D`)

Commands marked with `*` show a service picker first.

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>Du` | `compose up -d`             |
| `<leader>Dd` | `compose down`              |
| `<leader>Db` | `compose build`             |
| `<leader>Ds` | `compose ps`                |
| `<leader>Dl` | Follow logs `*`             |
| `<leader>Dr` | Restart service `*`         |
| `<leader>De` | Exec bash `*`               |
| `<leader>Dt` | Run pytest in container `*` |

---

## Completion (blink.cmp)

| Key                 | Action                |
| ------------------- | --------------------- |
| `<Tab>` / `<S-Tab>` | Next / prev item      |
| `<CR>`              | Confirm               |
| `<C-Space>`         | Trigger completion    |
| `<C-e>`             | Close                 |
| `<C-b>` / `<C-f>`   | Scroll docs up / down |

---

## Editing Utilities

### Comments (mini.comment)

| Key          | Action                  |
| ------------ | ----------------------- |
| `gcc`        | Toggle comment (line)   |
| `gc{motion}` | Toggle comment (motion) |
| `gc`         | Toggle comment (visual) |

### Surround (mini.surround)

| Key             | Action                   |
| --------------- | ------------------------ |
| `gsa{char}`     | Add surrounding          |
| `gsd{char}`     | Delete surrounding       |
| `gsr{old}{new}` | Replace surrounding      |
| `gsf{char}`     | Find surrounding (right) |
| `gsF{char}`     | Find surrounding (left)  |

### Treesitter Selection

| Key         | Action           |
| ----------- | ---------------- |
| `<C-Space>` | Expand selection |
| `<BS>`      | Shrink selection |

---

## Markdown

Powered by `render-markdown.nvim` (inline) and `markdown-preview.nvim` (browser).
Rendering is on by default in Normal mode and pauses in Insert mode.

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>cp` | Open preview in browser |
| `<leader>hc` | Open this cheatsheet    |

---

## Terminal

| Key                    | Action          |
| ---------------------- | --------------- |
| `<leader>ft` / `<C-/>` | Terminal (root) |
| `<leader>fT`           | Terminal (cwd)  |

---

## UI Toggles (`<leader>u`)

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>us` | Spell check             |
| `<leader>uw` | Word wrap               |
| `<leader>ul` | Line numbers            |
| `<leader>uL` | Relative line numbers   |
| `<leader>ud` | Diagnostics             |
| `<leader>uh` | Inlay hints             |
| `<leader>uc` | Conceal level           |
| `<leader>uT` | Treesitter highlight    |
| `<leader>ub` | Light / dark background |
| `<leader>uC` | Colorscheme picker      |
| `<leader>un` | Dismiss notifications   |

---

## Misc

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>l`  | Lazy.nvim (plugin manager)  |
| `<leader>cm` | Mason (LSP installer)       |
| `<leader>qq` | Quit all                    |
| `<leader>?`  | Buffer keymaps (which-key)  |
| `<leader>ui` | Inspect highlight at cursor |
