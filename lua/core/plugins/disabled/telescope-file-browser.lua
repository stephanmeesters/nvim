return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = { "<leader>n", "<leader>m" },
    config = function()
        require("telescope").load_extension "file_browser"

        vim.api.nvim_set_keymap(
            "n",
            "<leader>n",
            ":Telescope file_browser<CR>",
            { noremap = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>m",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { noremap = true }
        )
    end
}
