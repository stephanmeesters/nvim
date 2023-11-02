return {
    "mrquantumcodes/bufferchad.nvim",
    requires = {
        {"nvim-telescope/telescope.nvim"}
    },
    config = function ()
        require("bufferchad").setup({
          mapping = "<C-e>", -- Map any key, or set to NONE to disable key mapping
          mark_mapping = "<leader>bm", -- The keybinding to display just the marked buffers
          order = "LAST_USED_UP", -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
          style = "default", -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
          close_mapping = "<C-e>"
        })
    end
}
