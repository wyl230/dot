return {
  requires = { "nvim-treesitter/nvim-treesitter" },
  "Badhi/nvim-treesitter-cpp-tools",
  config = function()
    require("nt-cpp-tools").setup({
      preview = {
        quit = "q", -- optional keymapping for quit preview
        accept = "<tab>", -- optional keymapping for accept preview
      },
      header_extension = "h", -- optional
      source_extension = "cxx", -- optional
      custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
          output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
        },
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context) 
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
        -- feat:
        -- TSCppMakeConcreteClass	Create a concrete class implementing all the pure virtual functions
        -- TSCppRuleOf3	Adds the missing function declarations to the class to obey the Rule of 3 (if eligible)
        -- TSCppRuleOf5	Adds the missing function declarations to the class to obey the Rule of 5 (if eligible)
      },
    })
    vim.keymap.set("v", "<leader>cpp", ":TSCppDefineClassFunc<cr>", { silent = true, desc = "define class func" })
  end,
  event = "VeryLazy",
}
