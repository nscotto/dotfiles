return {
  { "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
  -- { "HiPhish/nvim-ts-rainbow2", enabled = true, version = "*", lazy = false },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   dependencies = { "HiPhish/nvim-ts-rainbow2" },
  --   config = function(_, opts)
  --     vim.list_extend(opts, {
  --       rainbow = {
  --         enable = true,
  --         -- list of languages you want to disable the plugin for
  --         disable = { "jsx" },
  --         -- Which query to use for finding delimiters
  --         query = "rainbow-parens",
  --         -- Highlight the entire buffer all at once
  --         strategy = require("ts-rainbow.strategy.global"),
  --         -- Do not enable for files with more than n lines
  --         max_file_lines = 3000,
  --       },
  --     })
  --     require("nvim-treesitter.configs").setup(opts)
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({})
    end,
    event = "VeryLazy",
    enabled = false,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
    lazy = false,
  },
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   config = true,
  --   cmd = "SymbolsOutline",
  --   keys = {
  --     {
  --       "<leader>cs",
  --       "<cmd>SymbolsOutline<cr>",
  --       desc = "LSP symbols outline",
  --     },
  --   },
  --   opts = {
  --     show_relative_numbers = true,
  --     autofold_depth = 0,
  --   },
  -- },
  {
    "stevearc/aerial.nvim",
    config = true,
    keys = {
      {
        "<leader>cs",
        "<cmd>AerialToggle<cr>",
        "Aerial code preview",
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "cshuaimin/ssr.nvim",
    -- init is always executed during startup, but doesn't load the plugin yet.
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>cR", function()
        -- this require will automatically load the plugin
        require("ssr").open()
      end, { noremap = true, desc = "Structural Replace" })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    lazy = false,
  },
  {
    "rmagatti/goto-preview",
    config = true,
    keys = {
      {
        "<leader>cpd",
        function()
          require("goto-preview").goto_preview_definition()
        end,
        desc = "Preview definition",
      },
      {
        "<leader>cpt",
        function()
          require("goto-preview").goto_preview_type_definition()
        end,
        desc = "Preview type definition",
      },
      {
        "<leader>cpi",
        function()
          require("goto-preview").goto_preview_implementation()
        end,
        desc = "Preview implementation",
      },
      {
        "<leader>cP",
        function()
          require("goto-preview").close_all_win()
        end,
        desc = "All win",
      },
      {
        "<leader>cpr",
        function()
          require("goto-preview").goto_preview_references()
        end,
        desc = "Preview references",
      },
    },
  },
}
