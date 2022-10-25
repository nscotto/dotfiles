vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None" })
