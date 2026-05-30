return {
  -- Override terraform-ls configuration if needed
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          -- Add any custom terraform-ls settings here
          settings = {
            terraform = {
              validate = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },

  -- Ensure Mason installs what we need
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "terraform-ls",
        "tflint",
        "tfsec",
      })
    end,
  },
}
