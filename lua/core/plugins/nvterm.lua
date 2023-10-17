return {
  "NvChad/nvterm",
  config = function ()
    require("nvterm").setup()
    local terminal = require("nvterm.terminal")
    vim.keymap.set("n", "<A-t>", function() terminal.toggle('horizontal') end)
  end,
  event = "VeryLazy"
}
