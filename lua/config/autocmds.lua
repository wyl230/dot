-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- autocmd ColorScheme * highlight Visual gui=reverse
--

vim.api.nvim_command("autocmd FileType vhdl setlocal commentstring=--\\ %s")

-- 定义函数来移除formatoptions中的"c"、"r"和"o"选项
local function remove_formatoptions(options)
  local result = {}
  for _, opt in ipairs(options) do
    if opt ~= "c" and opt ~= "r" and opt ~= "o" then
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
vim.opt_local.formatoptions = table.concat(formatoptions, "")

-- add auto format for python using black
local group = vim.api.nvim_create_augroup("Black", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
  pattern = "*.py",
  command = "silent !black %",
  group = group,
})

function async_black()
  local bufnr = vim.api.nvim_get_current_buf()

  local uv = require("luv")
  local stdout = uv.new_pipe(false)
  local stderr = uv.new_pipe(false)
  local stdin = uv.new_pipe(false)

  local handle = uv.spawn("black", {
    args = { "--fast", "-q", "-" },
    stdio = { stdin, stdout, stderr },
    cwd = vim.loop.cwd(),
    detached = true,
  }, function(code, signal)
    -- print("black process exited with code: " .. code .. ", signal: " .. signal)
  end)

  local data = {}
  uv.read_start(stdout, function(err, chunk)
    assert(not err, err)
    if chunk then
      table.insert(data, chunk)
    else
      local all_data = table.concat(data)
      vim.schedule(function()
        local save_view = vim.fn.winsaveview()
        local curpos = vim.fn.getcurpos()
        local save_jumplist = vim.fn.getjumplist()[1]
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(all_data:sub(1, -2), "\n"))
        for i = 1, #save_jumplist do
          if save_jumplist[i].bufnr == bufnr then
            vim.cmd("normal! " .. save_jumplist[i].lnum .. "G" .. save_jumplist[i].col .. "|")
          end
        end
        vim.cmd("normal! " .. curpos[2] .. "G" .. curpos[3] .. "|")
        vim.fn.winrestview(save_view)
      end)
    end
  end)

  uv.read_start(stderr, function(err, data)
    assert(not err, err)
    if data then
      print("stderr data: " .. data)
    end
  end)

  local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local all_text = table.concat(content, "\n")
  stdin:write(all_text)
  stdin:shutdown()
end

-- vim.cmd([[
--   augroup async_black
--     autocmd!
--     autocmd FileType python autocmd BufWritePost <buffer> lua async_black()
--   augroup END
-- ]])

-- Treesitter automatic Python format strings
vim.api.nvim_create_augroup("py-fstring", { clear = true })
vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = { "*.py" },
  group = "py-fstring",
  --- @param opts AutoCmdCallbackOpts
  --- @return nil
  callback = function(opts)
    -- Only run if f-string escape character is typed
    if vim.v.char ~= "{" then
      return
    end

    -- Get node and return early if not in a string
    local node = vim.treesitter.get_node()

    if not node then
      return
    end
    if node:type() ~= "string" then
      node = node:parent()
    end
    if not node or node:type() ~= "string" then
      return
    end

    vim.print(node:type())
    local row, col, _, _ = vim.treesitter.get_node_range(node)

    -- Return early if string is already a format string
    local first_char = vim.api.nvim_buf_get_text(opts.buf, row, col, row, col + 1, {})[1]
    vim.print("row " .. row .. " col " .. col)
    vim.print("char: '" .. first_char .. "'")
    if first_char == "f" then
      return
    end

    -- Otherwise, make the string a format string
    vim.api.nvim_input("<Esc>m'" .. row + 1 .. "gg" .. col + 1 .. "|if<Esc>`'la")
  end,
})

local sh_group = vim.api.nvim_create_augroup("sh_group", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "sh_group",
  pattern = { "*.sh" },
  callback = function()
    vim.api.nvim_command("!chmod +x " .. vim.fn.expand("%"))
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
  group = "sh_group",
  pattern = { "*.sh" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    local line_count = vim.api.nvim_buf_line_count(buf)

    if line_count <= 1 then
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "#!/bin/bash" })
    else
      print("文件不为空，不执行写入操作")
    end
  end,
})

-----
function Yank(text)
  local escape = vim.fn.system("yank", text)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln(escape)
  else
    vim.fn.writefile({ escape }, "/home/wyl/testcopy", "b")
    -- vim.fn.writefile({ escape }, "/dev/tty", "b")
  end
end

vim.api.nvim_set_keymap("n", "<silent> <Leader>y", [[:call Yank(@0)<CR>]], { noremap = true, silent = true })

function CopyYank()
  local regcontents = vim.fn.getreg('"')
  local text = table.concat(regcontents, "\n")
  Yank(text)
end

-- local sh_group = vim.api.nvim_create_augroup("AutoCopyYank", { clear = true })
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   group = "AutoCopyYank",
--   pattern = { "*" },
--   callback = function()
--     local regcontents = vim.fn.getreg('"')
--     -- local text = table.concat(regcontents, "\n")
--     local text = regcontents
--     Yank(text)
--   end,
-- })

-- vim.api.nvim_exec(
--   [[
-- augroup AutoCopyYank
--     autocmd!
--     autocmd TextYankPost * call CopyYank()
-- augroup END
-- ]],
--   false
-- )
