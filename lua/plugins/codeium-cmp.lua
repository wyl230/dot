-- return {
--   -- The official plugin does not support nvim-cmp, use a community one instead.
--   {
--     "jcdickinson/codeium.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "hrsh7th/nvim-cmp",
--     },
--     config = function()
--       require("codeium").setup({
--       })
--     end,
--   },
-- }
return {
    {
        "jcdickinson/http.nvim",
        build = "cargo build --workspace --release"
    },
    {
        "jcdickinson/codeium.nvim",
        dependencies = {
            "jcdickinson/http.nvim",
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    }
}
