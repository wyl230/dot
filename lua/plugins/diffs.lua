return {
  {
    "will133/vim-dirdiff",
    event = "VeryLazy",
  },
  {
    "AndrewRadev/linediff.vim",
    event = "VeryLazy",
    config = function()
      -- vim.keymap.set("n", "<leader>di", ":Linediff<cr>", { silent = true, desc = "linediff" })
      vim.keymap.set("v", "<leader>ld", ":Linediff<cr>", { silent = true, desc = "linediff" })
    end,
  },
}
