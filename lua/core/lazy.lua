
local function grabPlugins()
    local files = {}
    local basedir = vim.fn.stdpath("config") .. "/lua/core/plugins/"
    for file in io.popen("fd . '" .. basedir .. "' -d 1 -t f -x echo {/.}"):lines() do
        table.insert(files, require("core.plugins." .. file))
    end
    return files
end


local function bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then

        print("* Installing lazy.nvim")

        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--single-branch",
            "https://github.com/folke/lazy.nvim.git",
            lazypath,
        })
    end
    vim.opt.runtimepath:prepend(lazypath)
end

bootstrap()
local plugin_list = grabPlugins()
require("lazy").setup(plugin_list)
