return {
    dependencies = { "tjdevries/colorbuddy.nvim" },
    "svrana/neosolarized.nvim",
    config = function()
        require('neosolarized').setup({
            comment_italics = true,
            background_set = true,
        })
    end
}
