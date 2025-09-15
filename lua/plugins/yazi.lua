return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {
      open_for_directories = false,
      keymaps = {
        -- we’ll map `<f1>` for help inside yazi itself:
        show_help = "<f1>",
      },
    },
  },
}
