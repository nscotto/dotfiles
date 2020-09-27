let g:ale_fix_on_save = 0
let g:ale_disable_lsp = 1
let g:ale_completion_autoimport = 1
let g:ale_linters = {
      \   'python': ['pylint'],
      \}
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
