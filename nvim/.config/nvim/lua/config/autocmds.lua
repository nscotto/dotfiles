-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

-- *.inc -> c++
local IncCppGrp = api.nvim_create_augroup("IncToCpp", { clear = true })
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.inc",
  command = "set ft=cpp",
  group = IncCppGrp,
})
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C->]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
local TermOpenGrp = api.nvim_create_augroup("TermOpen", { clear = true })
api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "term://*",
  command = "lua set_terminal_keymaps()",
  group = TermOpenGrp,
})
