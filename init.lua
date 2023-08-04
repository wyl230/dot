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


  -- require("notify").setup({
  --   timeout = 500,
  --   stages = "static",
  -- })
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
require'lspconfig'.lua_ls.setup {}
--
require'lspconfig'.pyright.setup {
  on_attach = on_attach,
  settings =
    {
      pyright = {autoImportCompletion = true,},
      python = {
        pythonPath = "/home/wyl/anaconda3/bin/python3",
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'off'
        }
      }
    }
}


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

-- lua line below 
  -- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
--   require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '>', right = '<'},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'},
--     lualine_c1 = { "os.date('%a')", 'data', "require'lsp-status'.status()" } ,
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c1 = { },
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
  -- lua line end



end

