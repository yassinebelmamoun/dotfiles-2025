-- Debug Adapter Protocol: remote-attach to Python running inside Docker.
--
-- Setup (one-time per service):
--   1. Add debugpy to your container's requirements:
--        pip install debugpy
--   2. Start your service with debugpy listening:
--        python -m debugpy --listen 0.0.0.0:5678 --wait-for-client your_app.py
--      Or inject via entrypoint:
--        python -c "import debugpy; debugpy.listen(('0.0.0.0', 5678))" && exec "$@"
--   3. Forward the port in docker-compose.yml:
--        ports:
--          - "5678:5678"
--   4. In nvim: <leader>da → select "Docker: attach (port 5678)"

return {
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      -- Replicate LazyVim's default setup: use Mason-installed debugpy for local debugging.
      -- We override config (instead of using opts) because nvim-dap-python uses a custom
      -- setup() call, not the standard opts pattern.
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")

      local dap = require("dap")

      -- Docker attach configs are inserted at the top so they appear first in the DAP picker.
      -- Adjust remoteRoot to match your container's WORKDIR.
      table.insert(dap.configurations.python, 1, {
        type = "python",
        request = "attach",
        name = "Docker: attach (port 5678)",
        connect = { host = "127.0.0.1", port = 5678 },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/app", -- must match the WORKDIR in your Dockerfile
          },
        },
        -- false = step into library code too (useful when debugging dependency issues)
        justMyCode = false,
      })

      -- Second config for a secondary service (e.g. Celery worker, async consumer).
      -- Expose port 5679 in docker-compose.yml for that service.
      table.insert(dap.configurations.python, 2, {
        type = "python",
        request = "attach",
        name = "Docker: attach (port 5679)",
        connect = { host = "127.0.0.1", port = 5679 },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/app",
          },
        },
        justMyCode = false,
      })
    end,
  },
}
