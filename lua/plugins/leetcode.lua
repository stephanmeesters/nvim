return {
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- picker (recommended)
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      plugins = { non_standalone = true }, -- lets :Leet open even with listed buffers
      lang = "rust",
    },
  },
}

