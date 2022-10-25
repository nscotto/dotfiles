vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _cpp
    autocmd!
    autocmd BufWinEnter *.inc :setf cpp
    " autocmd BufWinEnter *.cc :setf cpp
    " autocmd BufWinEnter *.h :setf cpp
    autocmd FileType cpp setlocal matchpairs+=<:>
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
--[[ vim.api.nvim_create_augroup("bufcheck", { clear = true }) ]]
--[[ vim.api.nvim_create_autocmd("FileType", { ]]
--[[     pattern = { "cpp" }, ]]
--[[     command = "setlocal matchpairs+=<:>", ]]
--[[ }) ]]
