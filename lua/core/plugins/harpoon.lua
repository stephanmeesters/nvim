return {
    "thePrimeagen/harpoon",
    commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    event = "VeryLazy",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>w", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>q", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<leader>[", function() harpoon:list():prev() end)
        -- vim.keymap.set("n", "<leader>]", function() harpoon:list():next() end)
    end
}
