return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = { { "<leader>n", mode = "n" } },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true })
  end,
}
