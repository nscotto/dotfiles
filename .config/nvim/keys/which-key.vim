" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'   , 'comment' ]
let g:which_key_map['e'] = [ ':Fern . -drawer -reveal=!@% -toggle' , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                      , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                      , 'split below']
let g:which_key_map['S'] = [ ':Startify'                   , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                         , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                      , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                        , 'zen' ]

" Far for project  wide search
let g:which_key_map.F = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

" p is for python
let g:which_key_map.p = {
      \ 'name' : '+Python' ,
      \ 't' : [':T ipython'                         , 'ipython'],
      \ '[' : [':Semshi goto class prev:'           , 'class prev'],
      \ ']' : [':Semshi goto class next:'           , 'class next'],
      \ '{' : [':Semshi goto function prev:'        , 'func prev'],
      \ '}' : [':Semshi goto function next:'        , 'func next'],
      \ }

" r is for REPL
let g:which_key_map.r = {
      \ 'name' : '+REPL' ,
      \ 'l' : [':TREPLSendLine'       , 'line'],
      \ 'f' : [':TREPLSendFile'       , 'file'],
      \ 'b' : [':Tnew'                , 'new'],
      \ 'j' : [':Tprevious'           , 'previous'],
      \ 'k' : [':Tnext'               , 'next'],
      \ 'p' : [':T ipython'           , 'ipython'],
      \ 't' : [':Ttoggle'             , 'toggle'],
      \ 's' : [':TREPLSendSelection'  , 'selection'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 't' : [':FloatermNew --height=6'                        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'p' : [':FloatermNew ipython'                           , 'ipython'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
