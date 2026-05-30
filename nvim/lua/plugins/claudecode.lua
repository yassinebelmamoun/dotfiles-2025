return {
  "coder/claudecode.nvim",
  opts = {
    terminal = { provider = "none" },
  },
  keys = {
    { "<leader>a",  nil,                              desc = "AI/Claude Code" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",          desc = "Send selection" },
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",     ft = { "neo-tree" }, desc = "Add file (tree)" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny diff" },
  },
}