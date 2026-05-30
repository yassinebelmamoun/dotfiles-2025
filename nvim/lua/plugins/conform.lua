-- Format-on-save using ruff (format + auto-fix).
-- Ruff runs locally, reading pyproject.toml / ruff.toml from the project root.
-- Keep your local ruff config in sync with what runs in CI inside Docker.
return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      -- Don't fall back to LSP formatting — ruff handles everything for Python.
      -- "never" replaces the deprecated lsp_fallback = false.
      lsp_format = "never",
      timeout_ms = 500,
    },
    formatters_by_ft = {
      -- Run ruff_format first (code style), then ruff_fix (auto-fix lint violations).
      -- They run sequentially in order: format -> fix.
      python = { "ruff_format", "ruff_fix" },
    },
    formatters = {
      ruff_format = {
        command = "ruff",
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
      },
      ruff_fix = {
        command = "ruff",
        args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
        -- Anchor to project root so ruff picks up pyproject.toml / ruff.toml
        cwd = require("conform.util").root_file({ "pyproject.toml", ".git" }),
      },
    },
  },
}
