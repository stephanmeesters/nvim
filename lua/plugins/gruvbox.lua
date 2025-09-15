return {
  -- add gruvbox
  { "https://github.com/sainnhe/gruvbox-material.git" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
