return {
  {
    "https://github.com/DingDean/wgsl.vim", --treesitter syntax
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        wgsl_analyzer = {}, -- This triggers Mason to ensure it's installed
      },
      setup = {

        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
          pattern = "*.wgsl",
          callback = function()
            vim.bo.filetype = "wgsl"
          end,
        }),

        wgsl_analyzer = function(_, opts)
          require("lspconfig").wgsl_analyzer.setup({})
          -- return true -- prevents default setup by LazyVim
        end,
      },
    },
  },
}
