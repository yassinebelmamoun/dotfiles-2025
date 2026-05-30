# Neovim Dotfiles

LazyVim-based Neovim configuration managed as a dotfiles repo.

## Structure

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/lazy.lua` — lazy.nvim bootstrap + plugin spec (leader = Space)
- `lua/config/options.lua` — Additional vim options (autoformat enabled)
- `lua/plugins/` — Per-concern plugin configs

## Plugin overview

| File | Purpose |
|------|---------|
| `python.lua` | Pyright (basic type-checking, auto-detects `.venv`) + Ruff LSP |
| `conform.lua` | Format-on-save via `ruff format` then `ruff check --fix` |
| `neotest.lua` | Pytest runner using `.venv/bin/python`, `-vv --tb=short` |
| `dap.lua` | Debug adapter (DAP core extra) |
| `docker.lua` | Docker/Compose support |
| `terraform.lua` | Terraform language support |
| `tmux.lua` | vim-tmux-navigator (Ctrl+h/j/k/l pane switching) |

## LazyVim extras enabled

python, dap.core, test.core, formatting.prettier, docker, yaml

## Conventions

- One plugin concern per file in `lua/plugins/`
- Python projects use a local `.venv` for LSP + test runs (even when code runs in Docker)
- Ruff config lives in each project's `pyproject.toml` / `ruff.toml`
- Colorscheme: tokyonight
