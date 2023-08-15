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

require'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = false
        },
        pyright = {
          enabled = false
        },
        pycodestyle = {
          enabled = false
        },
        pyflakes = {
          enabled = false
        },
        mccabe = {
          enabled = false
        }
      }
    }
  },
}
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




-- require("neoscroll").setup()
-- if vim.g.neovide == true then
-- vim.cmd 'set guifont=Hack\ NF:h10'
-- vim.o.guifont='Consolas:h10'
vim.o.guifont = "FiraCode NF:h14"
-- vim.o.guifont = { "Operator Mono,FiraCode NF:h10", "10" }
-- vim.o.guifont = "Operator Mono,FiraCode NF:h10"

vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
-- end



-- navbuddy
local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
    window = {
        border = "single",  -- "rounded", "double", "solid", "none"
                            -- or an array with eight chars building up the border in a clockwise fashion
                            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        -- size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
        size = "80%",       -- Or table format example: { height = "40%", width = "100%"}
        -- size = { height = "80%", width = "60%"},       -- Or table format example: { height = "40%", width = "100%"}
        position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
        -- position = {row = "50%", col = "100%"},   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
            left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
            },
            mid = {
                size = "40%",
                border = nil,
            },
            right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf",  -- Right section can show previews too.
                                   -- Options: "leaf", "always" or "never"
            }
        },
    },
    node_markers = {
        enabled = true,
        icons = {
            leaf = "  ",
            leaf_selected = " → ",
            branch = " ",
        },
    },
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = " ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    use_default_mappings = true,            -- If set to false, only mappings set
                                            -- by user are set. Else default
                                            -- mappings are used for keys
                                            -- that are not set by user
    mappings = {
        ["<esc>"] = actions.close(),        -- Close and cursor to original location
        ["q"] = actions.close(),

        ["j"] = actions.next_sibling(),     -- down
        ["k"] = actions.previous_sibling(), -- up

        ["h"] = actions.parent(),           -- Move to left panel
        ["l"] = actions.children(),         -- Move to right panel
        ["0"] = actions.root(),             -- Move to first panel

        ["v"] = actions.visual_name(),      -- Visual selection of name
        ["V"] = actions.visual_scope(),     -- Visual selection of scope

        ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name(),      -- Insert at start of name
        ["I"] = actions.insert_scope(),     -- Insert at start of scope

        ["a"] = actions.append_name(),      -- Insert at end of name
        ["A"] = actions.append_scope(),     -- Insert at end of scope

        ["r"] = actions.rename(),           -- Rename currently focused symbol

        ["d"] = actions.delete(),           -- Delete scope

        ["f"] = actions.fold_create(),      -- Create fold of current scope
        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

        ["c"] = actions.comment(),          -- Comment out current scope

        ["<enter>"] = actions.select(),     -- Goto selected symbol
        ["o"] = actions.select(),

        ["J"] = actions.move_down(),        -- Move focused node down
        ["K"] = actions.move_up(),          -- Move focused node up

        ["s"] = actions.toggle_preview(),   -- Show preview of current node

        ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
        ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

        ["t"] = actions.telescope({         -- Fuzzy finder at current level.
            layout_config = {               -- All options that can be
                height = 0.60,              -- passed to telescope.nvim's
                width = 0.60,               -- default can be passed here.
                prompt_position = "top",
                preview_width = 0.50
            },
            layout_strategy = "horizontal"
        }),

        ["g?"] = actions.help(),            -- Open mappings help window
    },
    lsp = {
        auto_attach = false,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    }
}
-- navbuddy end

require("luasnip.loaders.from_vscode").load({ paths = { "/home/wyl/.config/nvim/my-snippets" } }) -- Load snippets from my-snippets folder
