--
-- return {
--   'hrsh7th/nvim-cmp',
--   config = function ()
--     require'cmp'.setup {
--     snippet = {
--       expand = function(args)
--         require'luasnip'.lsp_expand(args.body)
--       end
--     },
--
--     sources = {
--       { name = 'luasnip' },
--       { name = 'codeium' },
--
--
--       -- more sources
--     },
--   }
--   end
-- }
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "Saecki/crates.nvim",
      -- "jcdickinson/codeium.nvim",
      -- /jcdickinson/codeium.nvim
      "Exafunction/codeium.vim",
      "hrsh7th/nvim-cmp",

      "hrsh7th/cmp-vsnip",
      "onsails/lspkind.nvim",

      event = { "BufRead Cargo.toml" },
      config = true,
    },
  },
  -- ---@param opts cmp.ConfigSchema
  -- opts = function(_, opts)
  --   local cmp = require("cmp")
  --   opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
  --     -- { name = "crates" },
  --     { name = "codeium" },
  --   }))
  -- end,
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources({
      { name = "copilot", group_index = 2 },
      { name = "codeium" },
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "crates" },
    })

    -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
    --   { name = "crates" },
    --   { name = "codeium" },
    -- }))

    opts.formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
        symbol_map = { Codeium = "", Copilot = "" },
      }),
    }
  end,
}
