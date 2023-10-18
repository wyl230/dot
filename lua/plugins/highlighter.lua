return {
  "azabiong/vim-highlighter",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>hl", "<cmd>Hi +<CR>", { silent = true, remap = true })
    vim.keymap.set("n", "<leader>hd", "<cmd>Hi -<CR>", { silent = true, remap = true })
  end,
}
