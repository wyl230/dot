return {
  {
      "abecodes/tabout.nvim",
      lazy = true,
      opts = {
          tabkey = "", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
          default_shift_tab = "<C-d>", -- reverse shift default action,
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
              { open = "'", close = "'" },
              { open = '"', close = '"' },
              { open = "`", close = "`" },
              { open = "(", close = ")" },
              { open = "[", close = "]" },
              { open = "{", close = "}" },
            },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {}, -- tabout will ignore these filetypes
        },
    },
  {
      "hrsh7th/nvim-cmp",
      dependencies = {
          { "abecodes/tabout.nvim" },
        },
    },
  {
      "L3MON4D3/LuaSnip",
          keys = {
          {
              "<tab>",
              function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Plug>(Tabout)"
          end,
              expr = true,
              silent = true,
              mode = "i",
            },
          {
              "<s-tab>",
              function()
            return require("luasnip").jump(-1) or "<Plug>(TaboutBack)"
          end,
              expr = true,
              silent = true,
              mode = { "i", "s" },
            },
        },

    },
}

-- return {
--   'abecodes/tabout.nvim',
--   -- dependencies = { "folke/flash.nvim" },
--   config = function()
--     require('tabout').setup {
--         tabkey = '<tab>', -- key to trigger tabout, set to an empty string to disable
--         backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
--         act_as_tab = true, -- shift content if tab out is not possible
--         act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
--         default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
--         default_shift_tab = '<C-d>', -- reverse shift default action,
--         enable_backwards = true, -- well ...
--         completion = true, -- if the tabkey is used in a completion pum
--         tabouts = {
--             {open = "'", close = "'"},
--             {open = '"', close = '"'},
--             {open = '`', close = '`'},
--             {open = '(', close = ')'},
--             {open = '[', close = ']'},
--             {open = '{', close = '}'}
--           },
--         ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
--         exclude = {} -- tabout will ignore these filetypes
--     }
--   end,
--   wants = {'nvim-treesitter'}, -- or require if not used so far
--   after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
-- }
