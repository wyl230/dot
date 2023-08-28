return {
  "nullchilly/fsread.nvim",
  -- :FSRead " Flow state visual range
  -- :FSClear " Clear all flow states
  -- :FSToggle " Toggle flow state
  config = function()
    vim.keymap.set("n", "<leader>fs", ":FSToggle<cr>", { silent = true })
  end,

  event = "VeryLazy", -- keep for lazy loading
}
