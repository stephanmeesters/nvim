return {
    "prettier/vim-prettier",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("v", "<leader>o", ":PrettierPartial<CR>", { noremap = true })
    end
}
