return {

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    -- opt = {}
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  { 'echasnovski/mini.pairs', enabled = false },
}
