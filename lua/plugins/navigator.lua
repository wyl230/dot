return {
  -- 'ray-x/guihua.lua',
  'ray-x/navigator.lua',
  requires = {
    { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    vim.keymap.set('n', "<leader>dp", ":lua require 'navigator'.setup()<cr>",
      { silent = true, remap = true, desc = 'power navigator' })
    -- require 'navigator'.setup()
  end
}
