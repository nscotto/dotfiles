return {
  { "s1n7ax/nvim-window-picker", config = true },
  { "kylechui/nvim-surround", enabled = true, config = true, event = "VeryLazy" },
  {
    "goolord/alpha-nvim",
    opts = function() end,
    enabled = vim.g.vscode == nil,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = true,
    lazy = false,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
        detection_methods = { "pattern" },
        -- patterns used to detect root dir, when **"pattern"** is in detection_methods
        patterns = { "src", ".git", ".bzr", "WORKSPACE" },
      })
    end,
    lazy = false,
  },
  {
    "famiu/bufdelete.nvim",
    cmd = "Bdelete",
    keys = {
      {
        "<S-q>",
        "<cmd>Bdelete<cr>",
        desc = "Close current buffer",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-project.nvim", build = "make" },
      { "nvim-telescope/telescope-file-browser.nvim", build = "make" },
      { "molecule-man/telescope-menufacture" },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        -- function() require("telescope").extensions.project.project{} end,
        "<cmd>Telescope projects<cr>",
        desc = "Find Project",
      },
      {
        "<leader>ff",
        function()
          require("telescope").extensions.menufacture.find_files()
        end,
        desc = "Find File",
      },
      {
        "<leader>sg",
        function()
          require("telescope").extensions.menufacture.live_grep()
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>sw",
        function()
          require("telescope").extensions.menufacture.grep_string()
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>sr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Search references",
      },
    },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("projects")
      telescope.load_extension("menufacture")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = vim.g.vscode == nil,
    cmd = "ToggleTerm",
    keys = {
      {
        "<leader>;t",
        "<cmd>ToggleTerm Horizontal<cr>",
        desc = "ToggleTerm",
      },
      {
        "<leader>;f",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Float Term",
      },
      {
        "<leader>;v",
        "<cmd>ToggleTerm direction=vertical size=80<cr>",
        desc = "Vertical Term",
      },
      {
        "<leader>;h",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Vertical Term",
      },
    },
    config = true,
  },
  {
    "giusgad/pets.nvim",
    enabled = vim.g.vscode == nil,
    cmd = "PetsNew",
    -- event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
    config = true,
  },
  {
    "monaqa/dial.nvim",
    init = function()
      vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end,
    --  TODO: congig https://github.com/monaqa/dial.nvim
  },
  {
    "glacambre/firenvim",

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = false,
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load({ plugins = "firenvim", wait = true })
      vim.fn["firenvim#install"](0)
    end,
  },
}

-- -- since this is just an example spec, don't actually load anything here and return an empty spec
-- -- stylua: ignore
-- if true then return {} end
-- -- every spec file under config.plugins will be loaded automatically by lazy.nvim
-- --
-- -- In your plugin files, you can:
-- -- * add extra plugins
-- -- * disable/enabled LazyVim plugins
-- -- * override the configuration of LazyVim plugins
-- return {
--   -- -- add gruvbox
--   -- { "ellisonleao/gruvbox.nvim" },
--   --
--   -- -- Configure LazyVim to load gruvbox
-- {
--   "lazyvim/lazyvim",
--   opts = {
--     colorscheme = "gruvbox",
--   },
-- },
--
--   -- change trouble config
--   {
--     "folke/trouble.nvim",
--     -- opts will be merged with the parent spec
--     opts = { use_diagnostic_signs = true },
--   },
--
--   -- disable trouble
--   { "folke/trouble.nvim", enabled = false },
--
--   -- add symbols-outline
--   {
--     "simrat39/symbols-outline.nvim",
--     cmd = "SymbolsOutline",
--     keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
--     config = true,
--   },
--
--   -- override nvim-cmp and add cmp-emoji
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = { "hrsh7th/cmp-emoji" },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local cmp = require("cmp")
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
--     end,
--   },
--
--   -- change some telescope options and a keymap to browse plugin files
--   {
--     "nvim-telescope/telescope.nvim",
--     keys = {
--       -- add a keymap to browse plugin files
--       -- stylua: ignore
--       {
--         "<leader>fp",
--         function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
--         desc = "Find Plugin File",
--       },
--     },
--     -- change some options
--     opts = {
--       defaults = {
--         layout_strategy = "horizontal",
--         layout_config = { prompt_position = "top" },
--         sorting_strategy = "ascending",
--         winblend = 0,
--       },
--     },
--   },
--
--   -- add telescope-fzf-native
--   {
--     "nvim-telescope/telescope.nvim",
--     dependencies = {
--       { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--       { "nvim-telescope/telescope-project.nvim", build = "make" },
--       { "nvim-telescope/telescope-file-browser.nvim", build = "make" },
--     },
--     -- apply the config and additionally load fzf-native
--     config = function(_, opts)
--       local telescope = require("telescope")
--       telescope.setup(opts)
--       telescope.load_extension("fzf")
--       telescope.load_extension("file_browser")
--       telescope.load_extension("project")
--     end,
--   },
--
--   -- add pyright to lspconfig
--   {
--     "neovim/nvim-lspconfig",
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- pyright will be automatically installed with mason and loaded with lspconfig
--         pyright = {},
--       },
--     },
--   },
--
--   -- add tsserver and setup with typescript.nvim instead of lspconfig
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "jose-elias-alvarez/typescript.nvim",
--       init = function()
--         require("lazyvim.util").on_attach(function(_, buffer)
--           -- stylua: ignore
--           vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
--           vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
--         end)
--       end,
--     },
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- tsserver will be automatically installed with mason and loaded with lspconfig
--         tsserver = {},
--       },
--       -- you can do any additional lsp server setup here
--       -- return true if you don't want this server to be setup with lspconfig
--       ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--       setup = {
--         -- example to setup with typescript.nvim
--         tsserver = function(_, opts)
--           require("typescript").setup({ server = opts })
--           return true
--         end,
--         -- Specify * to use this function as a fallback for any server
--         -- ["*"] = function(server, opts) end,
--       },
--     },
--   },
--
--   -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
--   -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
--   { import = "lazyvim.plugins.extras.lang.typescript" },
--
--   -- add more treesitter parsers
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = {
--       ensure_installed = {
--         "bash",
--         "help",
--         "html",
--         "javascript",
--         "json",
--         "lua",
--         "markdown",
--         "markdown_inline",
--         "python",
--         "query",
--         "regex",
--         "tsx",
--         "typescript",
--         "vim",
--         "yaml",
--       },
--     },
--   },
--
--   -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
--   -- would overwrite `ensure_installed` with the new value.
--   -- If you'd rather extend the default config, use the code below instead:
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       vim.list_extend(opts.ensure_installed, {
--         -- add tsx and treesitter
--         ensure_installed = {
--           "clangd",
--         },
--       })
--     end,
--   },
--
--   -- or you can return new options to override all the defaults
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function()
--       return {
--         --[[add your custom lualine config here]]
--       }
--     end,
--   },
--
--   -- use mini.starter instead of alpha
--   { import = "lazyvim.plugins.extras.ui.mini-starter" },
--
--   -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
--   { import = "lazyvim.plugins.extras.lang.json" },
--
--   -- add any tools you want to have installed below
--   {
--     "williamboman/mason.nvim",
--     opts = {
--       ensure_installed = {
--         "stylua",
--         "shellcheck",
--         "shfmt",
--         "flake8",
--       },
--     },
--   },
-- }
