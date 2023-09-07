local maybe_use_ui = not vim.g.vscode --[[ and not not vim.g.started_by_firenvim ]]
return {
  -- -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-moon",
      colorscheme = "kanagawa",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = true,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "kanagawa",
        callback = function()
          vim.fn.system("kitty +kitten themes Kanagawa")
          -- if vim.o.background == "light" then
          --   vim.fn.system("kitty +kitten themes Kanagawa_light")
          -- elseif vim.o.background == "dark" then
          --   vim.fn.system("kitty +kitten themes Kanagawa_dragon")
          -- else
          --   vim.fn.system("kitty +kitten themes Kanagawa")
          -- end
        end,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- opts = function(_, opts)
    --   opts.window.position = "left"
    -- end,
    -- init = function()
    --   api.nvim_create_autocmd({ "FileType" }, {
    --     pattern = "neo-tree",
    --     command = function () vim.g.neo_tree_is_running = true end(),
    --     group = api.nvim_create_augroup("neo-tree", { clear = true }),
    --   })
    -- end,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    cond = maybe_use_ui,
    keys = {
      {
        "<leader>up",
        function()
          require("mini.map").toggle()
        end,
        desc = "Toggle map preview",
      },
    },
    config = function()
      local map = require("mini.map")
      -- local diagnostic_integration = map.gen_integration.diagnostic({})
      local diagnostic_integration = map.gen_integration.diagnostic({
        error = "DiagnosticFloatingError",
        warn = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
      })
      -- local gistigns_integration = map.gen_integration.gitsigns({})
      -- map.setup({ integrations = { diagnostic_integration } })
      map.setup({
        diagnostic_integration,
        map.gen_integration.builtin_search({}),
        map.gen_integration.gitsigns({}),
      })
    end,
  },
  {
    "sidebar-nvim/sidebar.nvim",
    -- WARNING: DISABLED
    enabled = false,
    lazy = false,
    config = function()
      require("sidebar-nvim").setup({
        open = true,
      })
    end,
    cond = maybe_use_ui,
  },
  {
    "tiagovla/scope.nvim",
    cond = maybe_use_ui,
    lazy = false,
    config = true,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = true,
    lazy = false,
    cond = maybe_use_ui,
    -- WARNING: DISABLED
    enabled = false,
    opts = {
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
      },
      -- width = 80,
      buffers = {
        -- backgroundColor = "onedark",
        colors = {
          blend = -0.1,
        },
        right = {
          enabled = false,
        },
        scratchPad = {
          enabled = true,
          fileName = "scratchpad",
          location = "~/notes",
        },
        bo = {
          filetype = "norg",
        },
      },
      mappings = {
        toggle = "<leader>uk",
        widthDown = false,
        widthUp = false,
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    cond = maybe_use_ui,
    config = true,
    dependencies = { "folke/twilight.nvim" },
    keys = {
      {
        "<leader>uz",
        "<cmd>ZenMode<cr>",
        desc = "Zen Mode",
      },
      {
        "<leader>uq",
        function()
          require("zen-mode").toggle({
            plugins = {
              twilight = { enabled = false },
            },
          })
        end,
        desc = "Focus mode",
      },
      {
        "<leader>um",
        function()
          require("zen-mode").toggle({
            window = {
              options = {
                relativenumber = false,
              },
            },
            plugins = {
              twilight = { enabled = false },
            },
          })
        end,
        desc = "Marc mode",
      },
    },
    opts = {
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        gitsigns = { enabled = true }, -- disables git signs
        -- this will change the font size on kitty when in zen mode
        -- to make this work, you need to set the following kitty options:
        -- - allow_remote_control socket-only
        -- - listen_on unix:/tmp/kitty
        kitty = {
          enabled = true,
          font = "+4", -- font size increment
        },
      },
      on_close = function()
        vim.cmd(":silent !kitten @set-font-size -- -4")
      end,
    },
  },
  {
    "Pocco81/true-zen.nvim",
    -- enabled = maybe_use_ui,
    enabled = false,
    config = true,
    keys = {
      {
        "<leader>uz",
        ":TZAtaraxis<CR>",
        desc = "Zen mode",
      },
    },
    -- opts = {
    --
    -- }
  },
  {
    "knubie/vim-kitty-navigator",
    cond = maybe_use_ui,
    keys = {
      {
        "<C-h>",
        "<cmd>KittyNavigateLeft<cr>",
        desc = "Navigate window left",
      },
      {
        "<C-j>",
        "<cmd>KittyNavigateDown<cr>",
        desc = "Navigate window down",
      },
      {
        "<C-k>",
        "<cmd>KittyNavigateUp<cr>",
        desc = "Navigate window up",
      },
      {
        "<C-l>",
        "<cmd>KittyNavigateRight<cr>",
        -- function()
        --   if vim.bo.filetype == "neo-tree" then
        --     print("CALL FROM TREE")
        --     vim.cmd("KittyNavigateRight")
        --   end
        --   print("CALL")
        --   vim.cmd("KittyNavigateRight")
        -- end,
        desc = "Navigate window right",
      },
    },
    config = function()
      vim.g.kitty_navigator_no_mappings = 1
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          size = { height = 0.4 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        -- {
        --   title = "Neo-Tree Git",
        --   ft = "neo-tree",
        --   filter = function(buf)
        --     return vim.b[buf].neo_tree_source == "git_status"
        --   end,
        --   pinned = true,
        --   open = "Neotree position=right git_status",
        -- },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        {
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutline",
        },
        -- any other neo-tree windows
        "neo-tree",
      },
    },
  },
  -- prevent neo-tree from opening files in edgy windows
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
    },
  },
  -- fix bufferline.nvim offsets
  {
    "akinsho/bufferline.nvim",
    opts = function()
      local Offset = require("bufferline.offset")
      if not Offset.edgy then
        local get = Offset.get
        Offset.get = function()
          if package.loaded.edgy then
            local layout = require("edgy.config").layout
            local ret = { left = "", left_size = 0, right = "", right_size = 0 }
            for _, pos in ipairs({ "left", "right" }) do
              local sb = layout[pos]
              if sb and #sb.wins > 0 then
                local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
                ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
                ret[pos .. "_size"] = sb.bounds.width
              end
            end
            ret.total_size = ret.left_size + ret.right_size
            if ret.total_size > 0 then
              return ret
            end
          end
          return get()
        end
        Offset.edgy = true
      end
    end,
  },
}
