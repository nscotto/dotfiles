" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Theme
  Plug 'joshdick/onedark.vim'
  " Status line
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  " Dev fonts
  Plug 'ryanoasis/vim-devicons'
  " Colors
  Plug 'norcalli/nvim-colorizer.lua'
  " Rainbow parentheses
  Plug 'junegunn/rainbow_parentheses.vim'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'
  " Don't remove split when closing buffer
  Plug 'qpkorr/vim-bufkill'
  " Sneak motion
  Plug 'justinmk/vim-sneak'
  " Surround
  Plug 'tpope/vim-surround'
  " Commentary
  Plug 'tpope/vim-commentary'
  " Quick Scope
  Plug 'unblevable/quick-scope'
  " Which key
  Plug 'liuchengxu/vim-which-key'
  " Float term
  Plug 'voldikss/vim-floaterm'
  " Zen mode
  Plug 'junegunn/goyo.vim'
  " Startify
  Plug 'mhinz/vim-startify'
  " File explorer
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " Git integration
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Project wide find & replace
  Plug 'ChristianChiarulli/far.vim'
  " FZF integration
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  " Code linting
  Plug 'dense-analysis/ale'
  Plug 'maximbaz/lightline-ale'
  " Completion
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/float-preview.nvim'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-markdown-subscope'
  Plug 'ncm2/ncm2-pyclang'
  Plug 'HansPinckaers/ncm2-jedi'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Python
  Plug 'jeetsukumaran/vim-pythonsense'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  " REPL
  "Plug 'kassio/neoterm'
  Plug 'echasnovski/neoterm', { 'branch': 'bracketed-paste' }

call plug#end()
