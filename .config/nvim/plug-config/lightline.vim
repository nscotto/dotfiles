let g:lightline = {
			\   'colorscheme': 'onedark',
			\   'active': {
			\     'left':[ [ 'mode', 'paste' ],
			\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
			\     ],
			\     'right':[ ['lineinfo'],
			\ 							[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
			\     ]
			\   },
			\   'component': {
			\     'lineinfo': ' %3l:%-2v',
			\   },
			\   'component_function': {
			\     'gitbranch': 'fugitive#head',
			\   },
			\   'component_expand': {
			\  		'linter_checking': 'lightline#ale#checking',
			\  		'linter_infos': 'lightline#ale#infos',
			\  		'linter_warnings': 'lightline#ale#warnings',
			\  		'linter_errors': 'lightline#ale#errors',
			\  		'linter_ok': 'lightline#ale#ok',
			\ 	},
			\   'component_type': {
			\     'linter_checking': 'right',
			\     'linter_infos': 'right',
			\     'linter_warnings': 'warning',
			\     'linter_errors': 'error',
			\     'linter_ok': 'right',
			\   }
			\ }
let g:lightline.separator = {
			\   'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\   'left': '', 'right': '' 
			\}
let g:lightline.tabline = {
			\   'left': [ ['tabs'] ],
			\   'right': [ ['close'] ]
			\ }

set laststatus=2
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

