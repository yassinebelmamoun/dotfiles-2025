# Neovim Configuration

LazyVim-based Neovim setup optimized for **Python development with Docker Compose**. Code is edited locally in Neovim while services run inside Docker containers.

## Structure

```
nvim/
├── init.lua                    # Entry point — loads config/lazy.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap + LazyVim extras
│   │   ├── options.lua         # Vim options (autoformat enabled)
│   │   ├── keymaps.lua         # Custom keymaps
│   │   └── autocmds.lua        # Custom autocommands
│   └── plugins/
│       ├── python.lua          # Pyright + Ruff LSP config with .venv detection
│       ├── conform.lua         # Format-on-save (ruff format + ruff fix)
│       ├── dap.lua             # DAP remote-attach to Python in Docker
│       ├── docker.lua          # Docker Compose workflow keymaps (<leader>D)
│       ├── neotest.lua         # Neotest with pytest via local .venv
│       ├── terraform.lua       # Terraform LSP + tflint + tfsec
│       ├── tmux.lua            # Seamless tmux/nvim pane navigation
│       └── claudecode.lua      # Claude Code CLI integration (<leader>a)
```

## LazyVim Extras

Enabled in `lua/config/lazy.lua`:

| Extra | Purpose |
|---|---|
| `lang.python` | Pyright, Ruff, debugpy, neotest-python via Mason |
| `lang.docker` | Dockerfile and docker-compose LSP + treesitter |
| `lang.yaml` | YAML LSP with SchemaStore (docker-compose schema validation) |
| `dap.core` | Debug Adapter Protocol UI and keymaps |
| `test.core` | Neotest framework and keymaps |
| `formatting.prettier` | Prettier for YAML, JSON, Markdown |

## Python / Docker Workflow

This config is built around a common pattern: **edit locally, run in Docker**.

### LSP (pyright + ruff)

Pyright runs locally and needs access to your project's dependencies to resolve imports. The config in `python.lua` auto-detects a `.venv` directory at the project root and points pyright at it.

**Setup per project:**

```bash
python -m venv .venv
.venv/bin/pip install -r requirements.txt
```

This `.venv` mirrors what's installed inside your Docker containers. You don't activate it — pyright reads it directly.

Ruff handles linting via LSP and formatting via conform (format-on-save).

### Debugging (DAP)

`dap.lua` configures remote-attach to debugpy running inside Docker containers.

**Setup per service:**

1. Add `debugpy` to the container's requirements.
2. Start the service with debugpy listening:
   ```
   python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app.py
   ```
3. Forward the port in `docker-compose.yml`:
   ```yaml
   ports:
     - "5678:5678"
   ```
4. In Neovim: `<leader>da` and select "Docker: attach (port 5678)".

Two configs are pre-defined: port **5678** (primary service) and port **5679** (secondary service, e.g. a Celery worker).

### Testing (neotest)

Two ways to run tests:

- **`<leader>t` keymaps** — neotest runs pytest locally via `.venv` (fast feedback loop).
- **`<leader>Dt`** — runs pytest inside the Docker container (for integration tests that need running services).

### Docker Compose Keymaps

All under `<leader>D`. Per-service commands open a picker to choose the target.

| Keymap | Action |
|---|---|
| `<leader>Du` | `docker compose up -d` |
| `<leader>Dd` | `docker compose down` |
| `<leader>Db` | `docker compose build` |
| `<leader>Ds` | `docker compose ps` |
| `<leader>Dl` | Tail logs for a service |
| `<leader>Dr` | Restart a service |
| `<leader>De` | Exec into a service (bash) |
| `<leader>Dt` | Run pytest in a container |

## Other Plugins

### Terraform (`terraform.lua`)

Terraform-ls with validation enabled. Mason auto-installs `terraform-ls`, `tflint`, and `tfsec`.

### Tmux Navigation (`tmux.lua`)

`vim-tmux-navigator` for seamless pane switching between tmux and Neovim using `Ctrl-h/j/k/l`.

## AI Assistant (claudecode.nvim)

`claudecode.nvim` connects Neovim to an external Claude Code session via WebSocket MCP —
the same protocol used by the official VS Code/JetBrains extensions. Claude runs in a
tmux pane (not inside Neovim), connected with `/ide` in the Claude Code CLI.

Neovim's terminal provider is set to `none`, so the plugin only acts as an MCP server:
Claude sees your current file, selections, and LSP diagnostics in real-time without
opening any terminal split inside Neovim.

### Keymaps (`<leader>a`)

| Keymap | Action |
|---|---|
| `<leader>am` | Select model |
| `<leader>ab` | Add current buffer to Claude's context |
| `<leader>as` | Send visual selection to Claude |
| `<leader>as` | Add file to context (from neo-tree) |
| `<leader>aa` | Accept diff proposed by Claude |
| `<leader>ad` | Deny diff proposed by Claude |

### Workflow

1. Start Claude Code in a tmux pane and run `/ide` to connect to Neovim
2. Claude sees your file automatically via the MCP protocol
3. Select code and press `<leader>as` to send it as context
4. When Claude proposes edits, a diff buffer opens — use `<leader>aa` / `<leader>ad` to accept or reject

## Prerequisites

- Neovim >= 0.10
- A Nerd Font (for icons)
- `docker` and `docker compose` CLI
- `ruff` installed locally (Mason handles this)
- Node.js (for prettier, pyright)
