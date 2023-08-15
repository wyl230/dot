return {
  "neovim/nvim-lspconfig",
  dependencies = {
      {
          "SmiteshP/nvim-navbuddy",
          dependencies = {
              "SmiteshP/nvim-navic",
              "MunifTanjim/nui.nvim"
          },
          opts = { lsp = { auto_attach = true } }
      }
  },
  opts = {
    servers = {
      -- Ensure mason installs the server
      marksman = {},
      pyright = {},
      ruff_lsp = {},
      -- clangd = {
      --   keys = {
      --     { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      --   },
      --   root_dir = function(fname)
      --     return require("lspconfig.util").root_pattern(
      --       "Makefile",
      --       "configure.ac",
      --       "configure.in",
      --       "config.h.in",
      --       "meson.build",
      --       "meson_options.txt",
      --       "build.ninja"
      --     )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
      --       fname
      --     ) or require("lspconfig.util").find_git_ancestor(fname)
      --   end,
      --   capabilities = {
      --     offsetEncoding = { "utf-16" },
      --   },
      --   cmd = {
      --     "clangd",
      --     "--background-index",
      --     "--clang-tidy",
      --     "--header-insertion=iwyu",
      --     "--completion-style=detailed",
      --     "--function-arg-placeholders",
      --     "--fallback-style=llvm",
      --   },
      --   init_options = {
      --     usePlaceholders = true,
      --     completeUnimported = true,
      --     clangdFileStatus = true,
      --   },
      -- },
    },
    setup = {
      -- clangd = function(_, opts)
      --   local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
      --   require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
      --   return true
      -- end,
      ruff_lsp = function()
        require("lazyvim.util").on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = true
          end
        end)
      end,
    },
  },
  -- "neovim/nvim-lspconfig",
  -- event = "BufReadPre",
  -- dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- if you use nvim-cmp
  -- config = function()
    -- require("lspconfig").clangd.setup({})
  --
  --   require('lspconfig').rust_analyzer.setup {}
  --   require('lspconfig').lua_ls.setup {}
  --
  --   require'lspconfig'.pyright.setup{}
  --   -- require('lspconfig').pyright.setup {
  --   --   on_attach = on_attach,
  --   --   settings =
  --   --   {
  --   --     pyright = { autoImportCompletion = true, },
  --   --     python = {
  --   --       pythonPath = "/home/wyl/anaconda3/bin/python3",
  --   --       analysis = {
  --   --         autoSearchPaths = true,
  --   --         diagnosticMode = 'openFilesOnly',
  --   --         useLibraryCodeForTypes = true,
  --   --         typeCheckingMode = 'off'
  --   --       }
  --   --     }
  --   --   }
  --   -- }
  -- end,
}
