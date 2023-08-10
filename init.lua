-- 设置 insert 模式下光标形状为竖线
-- vim.cmd("autocmd InsertEnter * set guicursor=n-v-c:block-Cursor-iCursor")
-- 设置 normal 模式下光标形状为块状
-- vim.cmd("autocmd InsertLeave * set guicursor=n-v-c:block-Cursor")

if vim.g.vscode then
  -- VSCode extension
  require("config.lazy")
else
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")


  require("notify").setup({
    timeout = 3000,
    stages = "static",
  })
-- vim.api.nvim_command('autocmd ColorScheme * highlight Visual gui=reverse')
-- vim.api.nvim_command('highlight Visual gui=reverse')
-- vim.api.nvim_command("highlight Visual guibg=grey guifg=blue")
vim.api.nvim_command("highlight Visual guibg=peru guifg=wheat")

require('nvim_comment').setup()


 vim.api.nvim_command([[
  augroup set-commentstring-ag
  " autocmd!
  autocmd BufEnter *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  autocmd BufFilePost *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  augroup END
]])



end




require("telescope").load_extension("notify")

-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.pyls_ms.setup{}
-- require"nvim_lsp"

require'lspconfig'.clangd.setup{
  on_attach = function ()
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end
}
-- require'lspconfig'.rust_analyzer.setup{}
-- require'lspconfig'.lua_ls.setup {}
--
-- require'lspconfig'.pyright.setup {
--   on_attach = on_attach,
--   settings =
--     {
--       pyright = {autoImportCompletion = true,},
--       python = {
--         pythonPath = "/home/wyl/anaconda3/bin/python3",
--         analysis = {
--           autoSearchPaths = true,
--           diagnosticMode = 'openFilesOnly',
--           useLibraryCodeForTypes = true,
--           typeCheckingMode = 'off'
--         }
--       }
--     }
-- }
--

-- require'lspconfig'.pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         ruff = {
--           enabled = false
--         },
--         pyright = {
--           enabled = true
--         },
--         pycodestyle = {
--           enabled = false
--         },
--         pyflakes = {
--           enabled = false
--         },
--         mccabe = {
--           enabled = false
--         }
--       }
--     }
--   },
-- }
--
--

local custom_attach = function(client)
    print("Built-in LSP started.")

    require"completion".on_attach()
    require"diagnostic".on_attach()

    -- Not all of the below work in all servers

    -- Action
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    map("n", "<leader>go", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
    map("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")

    -- Goto
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    map("n", "<leader>dd", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
    map("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>")
    map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    map("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
    map("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")

    -- Diagnostic
    map("n", "[e", "<cmd>PrevDiagnosticCycle<CR>")
    map("n", "]e", "<cmd>NextDiagnosticCycle<CR>")


require("rust-tools").setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
  -- vim.bo.formatoptions
  -- local o = vim.o
  -- o.formatoptions = o.formatoptions .. 'tcrqnj'
  -- vim.cmd("formatoptions-=cro")


  -- ufo 
  -- Setup required for ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

end






