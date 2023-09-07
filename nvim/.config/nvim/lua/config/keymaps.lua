-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { silent = true }

-- Yank current file path
map("n", "<leader>fy", '<cmd>let @+=expand("%")<cr>', opts)

-- Window moving insert mode
map("i", "<C-h>", "<ESC><C-W>hi", opts)
map("i", "<C-l>", "<ESC><C-W>li", opts)
map("i", "<C-j>", "<ESC><C-W>ji", opts)
map("i", "<C-k>", "<ESC><C-W>ki", opts)
-- Window resizing normal mode
map("n", "<M-H>", "<C-W><", opts)
map("n", "<M-L>", "<C-W>>", opts)
map("n", "<M-J>", "<C-W>-", opts)
map("n", "<M-K>", "<C-W>+", opts)
map("n", "<M-h>", '<cmd>exe "vertical resize " . (winwidth(0) * 2/3)<cr>', opts)
map("n", "<M-l>", '<cmd>exe "vertical resize " . (winwidth(0) * 3/2)<cr>', opts)
map("n", "<M-j>", '<cmd>exe "resize " . (winheight(0) * 2/3)<cr>', opts)
map("n", "<M-k>", '<cmd>exe "resize " . (winheight(0) * 3/2)<cr>', opts)
-- Window resizing insert mode
map("i", "<M-H>", "<C-\\><C-W><", opts)
map("i", "<M-L>", "<C-\\><C-W>>", opts)
map("i", "<M-J>", "<C-\\><C-W>-", opts)
map("i", "<M-K>", "<C-\\><C-W>+", opts)
map("i", "<M-h>", '<C-\\><cmd>exe "vertical resize " . (winwidth(0) * 2/3)<cr>', opts)
map("i", "<M-l>", '<C-\\><cmd>exe "vertical resize " . (winwidth(0) * 3/2)<cr>', opts)
map("i", "<M-j>", '<C-\\><cmd>exe "resize " . (winheight(0) * 2/3)<cr>', opts)
map("i", "<M-k>", '<C-\\><cmd>exe "resize " . (winheight(0) * 3/2)<cr>', opts)
-- Window resizing terminal mode
map("t", "<M-H>", "<C-\\><C-N><C-W><", opts)
map("t", "<M-L>", "<C-\\><C-N><C-W>>", opts)
map("t", "<M-J>", "<C-\\><C-N><C-W>-", opts)
map("t", "<M-K>", "<C-\\><C-N><C-W>+", opts)
map("t", "<M-h>", '<C-\\><C-N><cmd>exe "vertical resize " . (winwidth(0) * 2/3)<cr>', opts)
map("t", "<M-l>", '<C-\\><C-N><cmd>exe "vertical resize " . (winwidth(0) * 3/2)<cr>', opts)
map("t", "<M-j>", '<C-\\><C-N><cmd>exe "resize " . (winheight(0) * 2/3)<cr>', opts)
map("t", "<M-k>", '<C-\\><C-N><cmd>exe "resize " . (winheight(0) * 3/2)<cr>', opts)

-- Tab navigation
map("n", "<M-t>", "<cmd>tabnew<cr>", opts)
map("n", "<M-h>", "<cmd>tabprev<cr>", opts)
map("n", "<M-l>", "<cmd>tabnext<cr>", opts)
map("n", "<M-q>", "<cmd>tabclose<cr>", opts)
map("n", "<M-[>", "<cmd>tabprev<cr>", opts)
map("n", "<M-]>", "<cmd>tabnext<cr>", opts)

-- Open link under cursor (because netrw disabled)
map("n", "gx", [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

map("n", "}", [[}zz]], opts)
map("n", "{", [[{zz]], opts)
