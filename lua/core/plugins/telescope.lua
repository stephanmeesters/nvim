return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "VeryLazy",
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    '%.svg',
                    '%.png',
                    '%.jpg',
                    '%.webp',
                    '%.afdesign',
                    '%.afphoto',
                }
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        --vim.api.nvim_set_keymap('n', '<C-i>', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
        vim.api.nvim_set_keymap('n', '<C-i>', ":Telescope file_browser<CR>", { noremap = true })
    end
}
