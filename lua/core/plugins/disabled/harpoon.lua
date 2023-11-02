return {
    "thePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  keys = { "<leader>a", "<C-e>" },
  config = function()
        require("harpoon").setup({
            global_settings = {
                tabline = true
            }
        })
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<C-.>", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader><leader>1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader><leader>2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
  end

}
