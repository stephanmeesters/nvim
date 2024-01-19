return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/aerial.nvim',
        },
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("aerial")
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        '%.svg',
                        '%.png',
                        '%.jpg',
                        '%.webp',
                        '%.afdesign',
                        '%.afphoto',
                        '%.dll',
                        '%.svg',
                        '%.pdb',
                        '%.lib',
                        '%.exe',
                    }
                },
                extensions = {
                    aerial = {
                        -- Display symbols as <root>.<parent>.<symbol>
                        show_nesting = {
                            ["_"] = false, -- This key will be the default
                            json = true, -- You can set the option for specific filetypes
                            yaml = true,
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            -- vim.keymap.set('n', '<C-e>', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
            vim.keymap.set("n", "<leader>a", function()
                require("telescope").extensions.aerial.aerial()
            end)

            --vim.api.nvim_set_keymap('n', '<C-i>', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
            -- vim.api.nvim_set_keymap('n', '<C-i>', ":Telescope file_browser<CR>", { noremap = true })
        end
    },
    {
        "Slotos/telescope-lsp-handlers.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require 'telescope-lsp-handlers'.setup()
        end
    }
}
