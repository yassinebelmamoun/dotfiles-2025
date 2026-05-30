-- Neotest: run tests locally using the .venv that mirrors your Docker container's packages.
--
-- Two ways to run tests:
--   <leader>t  keymaps → neotest runs pytest locally via .venv (fast feedback loop)
--   <leader>Dt         → runs pytest inside the Docker container (see docker.lua)
--
-- Keep your local .venv in sync with your container's requirements so that
-- local test runs behave the same as in-container runs.
return {
  {
    "nvim-neotest/neotest",
    -- optional = true: only applies if neotest is already loaded (by test.core extra)
    optional = true,
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          -- Relative path: resolves against cwd at test-run time, so it adapts
          -- when you switch between projects.
          python = ".venv/bin/python",
          -- -vv: verbose output to see individual assertions
          -- --tb=short: concise tracebacks (less noise in the neotest output panel)
          args = { "-vv", "--tb=short" },
        },
      },
    },
  },
}
