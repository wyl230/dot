-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- autocmd ColorScheme * highlight Visual gui=reverse
--


-- 定义函数来移除formatoptions中的"c"、"r"和"o"选项
local function remove_formatoptions(options)
    local result = {}
    for _, opt in ipairs(options) do
        if opt ~= 'c' and opt ~= 'r' and opt ~= 'o' then
            table.insert(result, opt)
        end
    end
    return result
end

-- 创建autocmd组
vim.cmd([[
  augroup NoAutoComment
  autocmd! 
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=qnj
  augroup end 
]])

-- 移除'c', 'r', 'o'选项
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
local formatoptions = remove_formatoptions(vim.opt_local.formatoptions:get())
vim.opt_local.formatoptions = table.concat(formatoptions, '')

-- add auto format for python using black
local group = vim.api.nvim_create_augroup("Black", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.py",
	command = "silent !black %",
	group = group,
})
