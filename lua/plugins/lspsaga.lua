return {
  "nvimdev/lspsaga.nvim",
  -- disabled = false,
  config = function()
    require("lspsaga").setup({
      ui = {
        code_action = "σ",
      },
      -- debug = false,
      -- use_saga_diagnostic_sign = true,
      -- error_sign = "",
      -- warn_sign = "",
      -- hint_sign = "",
      -- infor_sign = "",
      -- code_action_prompt = {
      --   enable = false,
      --   -- sign = false,
      --   -- sign_priority = 40,
      --   -- virtual_text = true,
      -- },
      -- finder_definition_icon = "  ",
      -- finder_reference_icon = "  ",
      -- max_preview_lines = 10,
      -- finder_action_keys = {
      --   open = "o",
      -- },
    })

    vim.keymap.set("n", "mf", ":Lspsaga finder<cr>", { silent = true, desc = "saga finder" })
    vim.keymap.set("n", "mo", ":Lspsaga outline<cr>", { silent = true, desc = "saga outline" })
    vim.keymap.set("n", "mi", "::Lspsaga incoming_calls<cr>", { silent = true, desc = "incoming calls" })
    vim.keymap.set("n", "mO", "::Lspsaga outgoing_calls<cr>", { silent = true, desc = "outgoing calls" })
    vim.keymap.set("n", "ml", "::Lspsaga show_line_diagnostics<cr>", { silent = true, desc = "show_line_diagnostics" })
    vim.keymap.set(
      "n",
      "mw",
      "::Lspsaga show_workspace_diagnostics<cr>",
      { silent = true, desc = "show_workspace_diagnostics" }
    )
    vim.keymap.set("n", "mp", "::Lspsaga peek_definition<cr>", { silent = true, desc = "peek definition" })
    vim.keymap.set("n", "mq", "::Lspsaga peek_definition<cr>", { silent = true, desc = "peek definition" })
    vim.keymap.set("n", "mt", "::Lspsaga peek_type_definition<cr>", { silent = true, desc = "peek type definition" })
  end,
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
