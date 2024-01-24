return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "rcarriga/nvim-dap-ui" },
        event = "VeryLazy",
        config = function()
            local dap = require('dap')
            -- local mason_registry = require("mason-registry")
            -- local codelldb = mason_registry.get_package("codelldb")

            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/local/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = '/home/stephan/.local/share/nvim/mason/packages/codelldb/codelldb',
                    args = { "--port", "${port}" }
                },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return "/home/stephan/genelec-wake-sleep/bin/Debug/net6.0/GenelecApp.dll"
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = false,
                },
            }

            dap.configurations.rust = {
                {
                    name = 'Launch',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        local output = vim.fn.systemlist("cargo build -q --message-format=json 2>1")
                        for _, l in ipairs(output) do
                            local json = vim.json.decode(l)
                            if json == nil then
                                error("error parsing json")
                            end
                            if json.success == false then
                                return error("error building package")
                            end
                            if json.executable ~= nil then
                                return json.executable
                            end
                        end
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    initCommands = function()
                        -- Find out where to look for the pretty printer Python module
                        local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                        local script_import = 'command script import "' ..
                            rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                        local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                        local commands = {}
                        local file = io.open(commands_file, 'r')
                        if file then
                            for line in file:lines() do
                                table.insert(commands, line)
                            end
                            file:close()
                        end
                        table.insert(commands, 1, script_import)

                        return commands
                    end,
                }
            }

            vim.keymap.set("n", '<leader>dk', function() dap.continue() end)
            vim.keymap.set("n", '<leader>dl', function() dap.run_last() end)
            vim.keymap.set("n", '<leader>db', function() dap.toggle_breakpoint() end)
            vim.keymap.set("n", '<leader>dx', function()
                dap.terminate()
                require('dapui').close()
            end)
            vim.keymap.set("n", '<leader>dg', function() dap.run_to_cursor() end)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = "VeryLazy",
        config = function()
            require("nvim-dap-virtual-text").setup {
                enabled = true,                     -- enable this plugin (the default)
                enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true,            -- show stop reason when stopped for exceptions
                commented = false,                  -- prefix virtual text with comment string
                only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
                all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
                clear_on_continue = false,          -- clear virtual text on "continue" (might cause flickering when stepping)
                display_callback = function(variable, buf, stackframe, node, options)
                    if options.virt_text_pos == 'inline' then
                        return ' = ' .. variable.value
                    else
                        return variable.name .. ' = ' .. variable.value
                    end
                end,
                -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
                virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

                -- experimental features:
                all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
            }
        end
    },
    {
        "rouge8/neotest-rust",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-rust")
                }
            })
            vim.keymap.set("n", '<leader>du', function() neotest.run.run() end)
            -- vim.keymap.set("n", '<leader>du', function() neotest.run.run({ strategy = "dap" }) end)
            -- vim.keymap.set("n", '<leader>dU', function() neotest.run.stop() end)
            vim.keymap.set("n", '<leader>dU', function() neotest.run.run(vim.fn.expand("%")) end)
        end
    },
}
