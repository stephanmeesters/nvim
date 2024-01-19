return {
    {
        "rktjmp/lush.nvim"
    },
    {
        "mcchrish/zenbones.nvim",
        config = function()
            vim.g.background = "dark";
            vim.g.darkness = "warm";
            vim.cmd [[colorscheme zenbones]]
        end
    }
}
