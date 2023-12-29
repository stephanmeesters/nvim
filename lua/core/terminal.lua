function build()
    local opts = {
        cwd = vim.fn.getcwd(),
        on_stdout = function(_, data, _)
        end,
        on_stderr = function(_, data, _)
            print("Error: " .. data)
        end,
        on_exit = function(_, exit_code, _)
            if exit_code == 0 then
                print("npm run compile completed successfully")
            else
                print("npm run compile failed with exit code: " .. exit_code)
            end
        end,
    }

    vim.cmd(':wa') -- save all
    vim.fn.jobstart("npm run build", opts) -- run compile script
end

vim.api.nvim_set_keymap('n', '<leader>b', [[:lua build()<CR>]], { noremap = true, silent = false })

