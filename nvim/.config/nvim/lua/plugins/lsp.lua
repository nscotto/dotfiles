return {
  {
    "ray-x/go.nvim",
    requires = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all()', -- if you need to install/update all binaries
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--compile-commands-dir=.",
            "--fallback-style=file",
          },
          init_options = {
            fallbackFlags = { "-std=gnu11" },
          },
        },
      },
    },
  },
}
