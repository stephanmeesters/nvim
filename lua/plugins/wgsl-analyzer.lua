return {
  {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      wgsl_analyzer = {
        settings = {
          ["wgsl-analyzer"] = {
            customImports = {
              ["common"]  = "src/pipelines/shaders/common.wgsl"
            },
          },
        },
      },
    },
  },
  }
}
