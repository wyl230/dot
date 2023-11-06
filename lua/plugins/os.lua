return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup()
    local copy = function(lines, _)
      require("osc52").copy(table.concat(lines, "\n"))
    end
    local paste = function()
      return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
    end
    vim.g.clipboard = {
      name = "osc52",
      copy = { ["+"] = copy, ["*"] = copy },
      paste = { ["+"] = paste, ["*"] = paste },
    }
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        vim.highlight.on_yank()
      end,
    })
  end,
}
