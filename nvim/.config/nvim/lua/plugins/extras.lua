return {
  -- Strudel plugin
  {
    "gruvw/strudel.nvim",
    build = "npm install",
    keys = {
      { "<leader>ml", function() require("strudel").launch() end, desc = "Launch Strudel" },
      { "<leader>mq", function() require("strudel").quit() end, desc = "Quit Strudel" },
      { "<leader>mt", function() require("strudel").toggle() end, desc = "Strudel Toggle Play/Stop" },
      { "<leader>mu", function() require("strudel").update() end, desc = "Strudel Update" },
      { "<leader>ms", function() require("strudel").stop() end, desc = "Strudel Stop Playback" },
      { "<leader>mb", function() require("strudel").set_buffer() end, desc = "Strudel set current buffer" },
      { "<leader>mx", function() require("strudel").execute() end, desc = "Strudel set current buffer and update" },
    },
    opts = {
      ui = {
        maximise_menu_panel = true,
        hide_menu_panel = false,
        hide_top_bar = false,
        hide_code_editor = false,
        hide_error_display = false,
      },
      update_on_save = false,
      sync_cursor = true,
      report_eval_errors = true,
      headless = false,
      browser_data_dir = "~/.cache/strudel-nvim/",
    },
  },

  -- Associate .str and .std files with JavaScript filetype for LSP
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Add .str and .std to JavaScript filetype detection
      vim.filetype.add({
        extension = {
          str = "javascript",
          std = "javascript",
        },
      })
    end,
  },

  -- Ensure vtsls (or ts_ls) attaches to .str/.std files
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- If using vtsls (LazyVim default)
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
        },
        -- If using ts_ls instead, uncomment below:
        -- ts_ls = {
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "javascript.jsx",
        --     "typescript",
        --     "typescriptreact",
        --     "typescript.tsx",
        --   },
        -- },
      },
    },
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "javascript" })
    end,
  },
}
