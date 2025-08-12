return {
  "nvim-neorg/neorg",
  enabled = false,
  cond = vim.g.vscode == nil,
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
  init = function()
    local api = vim.api
    local grp = api.nvim_create_augroup("Neorg", { clear = false })
    api.nvim_create_autocmd("BufNew", {
      pattern = "*.norg",
      command = "setlocal filetype=norg",
      group = grp,
    })
    api.nvim_create_autocmd("FileType", {
      pattern = "norg",
      command = "setlocal formatoptions-=cro",
      group = grp,
    })
  end,
  lazy = false,
}
