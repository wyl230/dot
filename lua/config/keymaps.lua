-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are alwayr set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herr
--
--
-- This file is automatically loaded by lazyvim.config.init
-- git keymap
vim.keymap.set("v", "y", "ygv<esc>", { desc = "yank to ori", remap = true, silent = true })
vim.keymap.set("n", "\\s", ":SnipRun<cr>", { desc = "tree hopper, origin show hex", remap = true, silent = true })
vim.keymap.set("v", "\\s", ":SnipRun<cr>", { desc = "tree hopper, origin show hex", remap = true, silent = true })

vim.keymap.set("n", "ga", ":lua require('tsht').nodes()<cr>", { desc = "tree hopper, origin show hex", remap = true, silent = true })

vim.keymap.set("n", "]a", "]%", { desc = "]%", remap = true, silent = true })
vim.keymap.set("n", "[a", "[%", { desc = "[%", remap = true, silent = true })

vim.keymap.set("n", "<leader>t", ":Translate<cr>", { desc = "translate", remap = true, silent = true })
vim.keymap.set("v", "<leader>t", ":Translate<cr>", { desc = "translate", remap = true, silent = true })
vim.keymap.set("n", "\\t", ":TranslateW<cr>", { desc = "translate", remap = true, silent = true })
vim.keymap.set("v", "\\t", ":TranslateW<cr>", { desc = "translate", remap = true, silent = true })

-- vim.keymap.set("n", "<leader>t", ":Translate<cr>", { desc = "translate", remap = true, silent = true })
-- vim.keymap.set("v", "<leader>t", ":Translate<cr>", { desc = "translate", remap = true, silent = true })
vim.keymap.set("n", "\\rr", ":Translate --target_lang=EN --source_lang=ZH<cr>", { desc = "translate to en", remap = true, silent = true })
vim.keymap.set("v", "\\rr", ":Translate --target_lang=EN --source_lang=ZH<cr>", { desc = "translate to en", remap = true, silent = true })
vim.keymap.set("n", "\\rt", ":TranslateR --target_lang=EN --source_lang=ZH<cr>", { desc = "translate to en", remap = true, silent = true })
vim.keymap.set("v", "\\rt", ":TranslateR --target_lang=EN --source_lang=ZH<cr>", { desc = "translate to en", remap = true, silent = true })

vim.keymap.set("n", "gh", "^", { desc = "$", remap = true, silent = true })
vim.keymap.set("n", "gl", "$", { desc = "^", remap = true, silent = true })
vim.keymap.set("n", "dgh", "d^", { desc = "$", remap = true, silent = true })
-- vim.keymap.set("n", "dgl", "d$", { desc = "^", remap = true, silent = true })
vim.keymap.set("v", "gh", "^", { desc = "$", remap = true, silent = true })
vim.keymap.set("v", "gl", "$", { desc = "^", remap = true, silent = true })

vim.keymap.set("n", "<leader>wq", ":tabc<esc>", { desc = "tabc: close diff view", remap = true, silent = true })
vim.keymap.set("n", "<leader>y", "viwy", { desc = "copy word", remap = true, silent = true })
vim.keymap.set("n", "<leader>Y", "viWy", { desc = "copy word", remap = true, silent = true })
vim.keymap.set("n", "<leader>v", "viw", { desc = "select a word", remap = true, silent = true })
vim.keymap.set("n", "<leader>V", "viW", { desc = "select a word", remap = true, silent = true })
vim.keymap.set("n", "<F9>", ":AerialToggle<cr>", { desc = "", remap = true, silent = true })
vim.keymap.set("i", "<F9>", "<esc>:AerialToggle<cr>i", { desc = "", remap = true, silent = true })
-- vim.keymap.set("n", ">", ">>", { desc = "", remap = true, silent = true })
vim.keymap.set("n", "<leader>gn", ":DiffviewOpen<cr>", { desc = "git diff with last commit", remap = true, silent = true })
vim.keymap.set("n", "<leader>ga", ":DiffviewFileHistory<cr>", { desc = "git diff with last commit", remap = true, silent = true })
--

vim.keymap.set("n", "<leader>wq", "<C-W>c", { desc = "Other window", remap = true })
vim.keymap.set("n", "<c-c>", ":q<CR>", { silent = true })
vim.keymap.set("i", "jj", "<esc>", { silent = true })
vim.keymap.set("n", "<enter>", "<esc>", { silent = true })
vim.keymap.set("n", "<down>", "<c-d>zz", { silent = true })
vim.keymap.set("n", "<up>", "<c-u>zz", { silent = true })
-- vim.keymap.set("n", "<left>", "<c-", { silent = true })
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("i", "kj", "<esc>", { silent = true })
vim.keymap.set("v", "q", "<esc>", { silent = true })
-- vim.keymap.set("x", "jj", "<esc>", { silent = true })
vim.keymap.set('n', '<leader>jk', vim.cmd.UndotreeToggle)
vim.keymap.set('n', "g'", "gcc", { remap = true })
vim.keymap.set('i', "g'", "<esc>gccA ", { remap = true })
vim.keymap.set('v', "g'", "gc", { remap = true })
vim.keymap.set('n', '<leader>cw', "yiw", { remap = true })
vim.keymap.set('n', '<leader>pw', "viwp", { remap = true })
vim.keymap.set('n', '<leader>o', ":lua vim.lsp.buf.code_action()<enter>", { remap = true, silent = true })
vim.keymap.set('n', '<leader>ro', ":!x run<cr>", { remap = true, silent = true })
vim.keymap.set('n', '<leader>rr', ":!x; and echo ========; and x run<cr>", { remap = true, silent = true })
vim.keymap.set('n', '<leader>n', ":Telescope notify<cr>", { remap = true, silent = true })
-- vim.keymap.set('n', '<F5>', ":!ap %<cr>", { remap = true, silent = true })
-- vim.keymap.set('n', '<c-j>', ":res +1<cr>", { remap = true, silent = true })
-- vim.keymap.set('n', '<c-k>', ":res -1<cr>", { remap = true, silent = true })
vim.keymap.set('n', 'K', "i<enter><esc>", { remap = true, silent = true })
-- vim.keymap.set('n', '<leader>d', ":lua vim.lsp.buf.definition()<cr>", { remap = true, silent = true })
vim.keymap.set('n', '<F2>', ":lua vim.lsp.buf.rename()<cr>", { remap = true, silent = true })

-- lsp_keymaps()
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "<leader>go", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {remap = true, silent = true})
vim.keymap.set("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {remap = true, silent = true})

vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { remap = true, silent = true })
-- vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>dl", ":LspRestart<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>dd", ":Navbuddy<CR>", { remap = true, silent = true })
vim.keymap.set("n", "\\d", ":Navbuddy<CR>", { remap = true, silent = true })
vim.keymap.set("n", "\\w", "<C-W>p", { desc = "Other window", remap = true })

vim.keymap.set("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", { remap = true, silent = true })
-- vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>cF", "<cmd>lua vim.lsp.buf.format()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>at", ":ClangdAST<CR>", { remap = true, silent = true })
vim.keymap.set("v", "<leader>at", ":ClangdAST<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>ak", "<cmd>lua vim.cmd.ClangdSymbolInfo()<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", { remap = true, silent = true })

-- Diagnostic
vim.keymap.set("n", "[e", "<cmd>PrevDiagnosticCycle<CR>", { remap = true, silent = true })
vim.keymap.set("n", "]e", "<cmd>NextDiagnosticCycle<CR>", { remap = true, silent = true })

-- kill new definition buffer
vim.keymap.set("n", "--", "<space>bd", { remap = true, silent = true })
vim.keymap.set("n", "_", "<space>wd", { remap = true, silent = true })
vim.keymap.set("n", "Q", "<space>bd", { remap = true, silent = true })


-- vim.keymap.set("n", "<c-/>", lazyterm, { slient = true, remap = true })
-- vim.keymap.set("n", "<F6>", ":UndotreeToggle<enter>", {slient = true})

--
-- local Util = require("lazyvim.util")
--
-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   -- do not create the keymap if a lazy keys handler exists
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     if opts.remap and not vim.g.vscode then
--       opts.remap = nil
--     end
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end
--
-- vim.keymap.set("i", "jk", "<esc>", { slient = true})
-- -- better up/down
-- -- map({ "i", "x" }, "jj", "<esc>", { silent = true })
--
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--
-- -- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
--
-- -- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
--
-- -- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
--
-- -- buffers
-- if Util.has("bufferline.nvim") then
--   map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
--   map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
--   map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
--   map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- else
--   map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
--   map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
--   map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
--   map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- end
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--
-- -- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
--
-- -- Clear search, diff update and redraw
-- -- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )
--
-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
--
-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
--
-- -- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
--
-- -- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
--
-- -- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
--
-- -- lazy
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
--
-- -- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
--
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
--
-- if not Util.has("trouble.nvim") then
--   map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
--   map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
-- end
--
-- -- stylua: ignore start
--
-- -- toggle options
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.inlay_hint then
--   map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
-- end
--
-- -- lazygit
-- map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
-- map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })
--
-- -- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
--
-- -- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end
--
-- -- LazyVim Changelog
-- map("n", "<leader>L", Util.changelog, {desc = "LazyVim Changelog"})
--
-- -- floating terminal
-- local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
--
-- -- Terminal Mappings
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
--
-- -- windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
--
-- -- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
--
--
--
-- map("n", "<leader>r", "<C-W>p", { desc = "Other window", remap = true })
--
--
--
-- filetype

-- local wk = require("which-key")
--
-- wk.register({
-- ["<leader>mm"] = {
--   function()
--     local buf = vim.api.nvim_get_current_buf()
--     local ft = vim.api.nvim_buf_get_option(buf, "filetype")
--     print(ft)
--     if ft == "python" then
--       vim.keymap.set('n', '<F5>', ":!ap %<cr>", { remap = true, silent = true })
--     elseif ft == "cpp" then
--       -- vim.keymap.set('n', '<F5>', ":!echo 23", { remap = true, silent = true })
--       vim.keymap.set('n', '<F5>', ":!x; and echo ========; and x run<cr>", { remap = true, silent = true })
--     elseif ft == "rust" then
--       vim.keymap.set('n', '<F5>', ":!rustc % -o r; and echo ========; and ./r<cr>", { remap = true, silent = true })
--     end
--
--   end, "do something"
-- }
-- })
--
function keymap_by_file_type()

  -- vim.cmd('BlockOn')
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    vim.keymap.set('n', '<leader>as', ":AsyncStop<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<F3>', ":w<cr>:AsyncTask file-build<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F3>', "<esc>:w<cr>:AsyncTask file-build<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<F4>', ":w<cr>:AsyncTask file-run<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F4>', "<esc>:w<cr>:AsyncTask file-run<cr>", { remap = true, silent = true })
  -- print(ft)
  if ft == "python" then
    vim.keymap.set('n', '<F5>', ":!ap %<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F5>', "<esc>:!ap %<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<leader>cf', ":lua async_black()<cr>", { remap = true, silent = true })
  elseif ft == "cpp" then
    -- vim.keymap.set('n', '<F5>', ":!echo 23", { remap = true, silent = true })
    vim.keymap.set('n', '<F5>', ":!x; and echo ========; and x run<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<F7>', ":!g++ % -o r; and echo ========; and ./r<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F7>', "<esc>:!g++ % -o r; and echo ========; and ./r<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F5>', "<esc>:!x; and echo ========; and x run<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<F6>', ":!x run<cr>", { remap = true, silent = true })
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  elseif ft == "rust" then
    vim.keymap.set('n', '<F5>', ":!rustc % -o r; and echo ========; and ./r<cr>", { remap = true, silent = true })
    vim.keymap.set('i', '<F5>', "<esc>:!rustc % -o r; and echo ========; and ./r<cr>", { remap = true, silent = true })
    vim.keymap.set('n', '<F6>', ":!./r<cr>", { remap = true, silent = true })
  end
end

vim.cmd('autocmd FileType * lua keymap_by_file_type()')

vim.keymap.set("n", "<c-p>", "<leader>fF", { silent = true, remap = true })
vim.keymap.set("i", "<c-p>", "<leader>fF", { silent = true, remap = true })
vim.keymap.set("i", "<esc>", "<esc><esc>", { silent = true, remap = true })
vim.keymap.set("n", "\\a", "ggVG", { silent = true, remap = true })
vim.keymap.set("n", "\\q", ":qa<cr>", { silent = true, remap = true }) -- for safety
-- vim.keymap.set("n", "\\q", ":qa!<cr>", { silent = true, remap = true })
vim.keymap.set("i", "\\q", "<esc>:qa<cr>", { silent = true, remap = true })
vim.keymap.set("n", "\\y", "ggVGy", { silent = true, remap = true })


vim.keymap.set("i", "<c-\\>", "codeium#Accept()", { silent = true, remap = true, nowait = true, expr = true })
vim.keymap.set("i", "<A-l>", "codeium#Accept()", { silent = true, remap = true, nowait = true, expr = true })
vim.keymap.set("i", "<c-e>", "codeium#Complete()", { silent = true, remap = true, nowait = true, expr = true })
  -- imap <script><silent><nowait><expr> qwe 

vim.keymap.set("v", "\'", "%", { silent = true, remap = true, nowait = true, expr = false })


-- prime
-- vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true})
--
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
--
-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)
--
-- -- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
--
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
--
-- -- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
--
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
-- 定义一个变量来记录当前状态
local enter_counter = 0

-- 设置 <Enter> 键在不同次数下执行不同命令
-- 保存原始的键映射
-- local original_enter_mapping = vim.api.nvim_get_keymap('n')
-- print(original_enter_mapping)
-- local myTable = original_enter_mapping
-- for key, value in pairs(myTable) do
--     print(key, value)
--   for k, v in pairs(value) do
--     print(k, v)
--   end
-- end

-- vim.api.nvim_set_keymap('n', '<S-CR>', original_enter_mapping, { noremap = true, silent = true })
vim.keymap.set("n", "z<CR>", "<CR>", { desc = "original cr", silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<CR>', ':lua toggle_enter_action()<CR>', { noremap = true, silent = true })

-- 切换命令的函数
function toggle_enter_action()
    if enter_counter == 0 then
        vim.cmd('normal! zc')
        enter_counter = 1
    else
        vim.cmd('normal! zo')
        enter_counter = 0
    end
end
