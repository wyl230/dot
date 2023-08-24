return {
  -- add gruvbox
  { 'Exafunction/codeium.vim' },
  -- { 'jcdickinson/codeium.nvim' },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "dotsilas/darcubox-nvim" },
  { "Mofiqul/dracula.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "nightfox", -- not good enough
      -- colorscheme = "dayfox", -- too light
      -- colorscheme = "dawnfox", -- bad
      -- colorscheme = "duskfox", -- bad
      -- colorscheme = "nordfox", -- bad
      -- colorscheme = "terafox", -- not good enough
      colorscheme = "carbonfox", -- good
      -- colorscheme = "kanagawa-dragon", -- bad
      -- colorscheme = "kanagawa-lotus", -- bad
    },
  },
}
