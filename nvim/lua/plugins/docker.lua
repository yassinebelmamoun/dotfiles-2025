-- Docker Compose workflow: manage containers without leaving nvim.
-- All keymaps are under <leader>D.
-- Per-service commands open a picker to choose which service to target.
-- Commands run in a Snacks floating terminal (interactive, scrollable).
--
-- Prerequisites: docker and docker compose CLI installed on the host.

--- Query docker compose for services and let the user pick one.
--- Falls back with a warning if no docker-compose.yml is found.
local function pick_service(callback)
  vim.fn.jobstart("docker compose config --services 2>/dev/null", {
    stdout_buffered = true,
    on_stdout = function(_, data)
      local services = vim.tbl_filter(function(s)
        return s ~= ""
      end, data or {})
      if #services == 0 then
        vim.notify("No docker compose services found in " .. vim.fn.getcwd(), vim.log.levels.WARN)
        return
      end
      -- vim.schedule: jobstart callback runs outside the main loop,
      -- but vim.ui.select needs the main loop for the picker UI.
      vim.schedule(function()
        vim.ui.select(services, { prompt = "Select service:" }, function(service)
          if service then
            callback(service)
          end
        end)
      end)
    end,
  })
end

return {
  -- Register <leader>D group in which-key so it shows a label
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>D", group = "docker" },
      },
    },
  },

  {
    "folke/snacks.nvim",
    keys = {
      -- Whole-stack operations
      {
        "<leader>Du",
        function() Snacks.terminal("docker compose up -d") end,
        desc = "Up (detached)",
      },
      {
        "<leader>Dd",
        function() Snacks.terminal("docker compose down") end,
        desc = "Down",
      },
      {
        "<leader>Db",
        function() Snacks.terminal("docker compose build") end,
        desc = "Build",
      },
      {
        "<leader>Ds",
        function() Snacks.terminal("docker compose ps") end,
        desc = "Status (ps)",
      },

      -- Per-service operations (opens a picker to choose the service)
      {
        "<leader>Dl",
        function()
          pick_service(function(s)
            Snacks.terminal("docker compose logs -f --tail=100 " .. s)
          end)
        end,
        desc = "Logs (follow)",
      },
      {
        "<leader>Dr",
        function()
          pick_service(function(s)
            Snacks.terminal("docker compose restart " .. s)
          end)
        end,
        desc = "Restart service",
      },
      {
        "<leader>De",
        function()
          pick_service(function(s)
            Snacks.terminal("docker compose exec " .. s .. " bash")
          end)
        end,
        desc = "Exec shell",
      },
      {
        "<leader>Dt",
        function()
          pick_service(function(s)
            -- Runs pytest inside the container. Override the command if you use
            -- a different test runner (e.g. "python -m pytest", "tox").
            Snacks.terminal("docker compose exec " .. s .. " pytest -vv")
          end)
        end,
        desc = "Run pytest in container",
      },
    },
  },
}
