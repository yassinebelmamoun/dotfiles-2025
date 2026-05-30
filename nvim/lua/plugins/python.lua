-- Python LSP: pyright for type-checking + completions, ruff for linting.
-- The LazyVim python extra (imported in lazy.lua) installs both via Mason.
-- This file tunes their settings for a local-edit / Docker-run workflow.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                -- "basic" catches common errors without being noisy.
                -- Switch to "strict" per-project via pyrightconfig.json if needed.
                typeCheckingMode = "basic",
                -- Let pyright find installed packages in the active venv
                autoSearchPaths = true,
                -- Read type stubs from third-party libraries (numpy, requests, etc.)
                useLibraryCodeForTypes = true,
                -- Only analyze open files — "workspace" is slower on large mono-repos.
                diagnosticMode = "openFilesOnly",
              },
            },
          },
          -- Auto-detect a local .venv so pyright resolves imports from
          -- the same packages your Docker containers use.
          -- Workflow: keep a local .venv in sync with your container's requirements
          -- (e.g. `python -m venv .venv && .venv/bin/pip install -r requirements.txt`)
          -- even though the code actually runs inside Docker.
          before_init = function(_, config)
            local venv = vim.fn.getcwd() .. "/.venv"
            if vim.fn.isdirectory(venv) == 1 then
              config.settings.python.pythonPath = venv .. "/bin/python"
            end
          end,
        },
        ruff = {
          -- Ruff LSP handles linting alongside pyright's type-checking.
          -- Format-on-save is handled separately by conform.nvim (see conform.lua).
          init_options = {
            settings = {
              -- Extra CLI args for the ruff LSP. Leave empty to use pyproject.toml config.
              args = {},
            },
          },
        },
      },
    },
  },
}
