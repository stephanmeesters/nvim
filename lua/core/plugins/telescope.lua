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
                            json = true,   -- You can set the option for specific filetypes
                            yaml = true,
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
            -- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
            -- vim.keymap.set('n', '<leader>pb', builtin., {})

            local telescope = require("telescope")
            -- telescope.load_extension('harpoon')
            -- vim.keymap.set("n", "<C-e>", function() telescope.extensions.harpoon.marks() end)

            telescope.load_extension("aerial")
            vim.keymap.set("n", "<leader>a", function()
                telescope.extensions.aerial.aerial()
            end)

            -- vim.api.nvim_set_keymap('n', '<leader>pb', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
            -- vim.api.nvim_set_keymap('n', '<C-i>', ":Telescope file_browser<CR>", { noremap = true })
            --
            telescope.load_extension("recent_files")
            vim.api.nvim_set_keymap("n", "<leader>pb",
                [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
                { noremap = true, silent = true })
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
    },
    {
        "smartpde/telescope-recent-files",
        event = "VeryLazy",
        dependencies = {
            'nvim-telescope/telescope.nvim',
        }
    }
}
