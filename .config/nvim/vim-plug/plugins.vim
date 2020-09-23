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
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Dev fonts
  Plug 'ryanoasis/vim-devicons'
  " Colors
  Plug 'norcalli/nvim-colorizer.lua'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Rainbow parentheses
  Plug 'junegunn/rainbow_parentheses.vim'
  " Don't remove split when closing buffer
  Plug 'qpkorr/vim-bufkill'
  " Sneak motion
  Plug 'justinmk/vim-sneak'
  " Surround
  Plug 'tpope/vim-surround'
  " Commentary
  Plug 'tpope/vim-commentary'
  Plug 'preservim/nerdcommenter'
  " Quick Scope
  Plug 'unblevable/quick-scope'
  " Which key
  Plug 'liuchengxu/vim-which-key'
  " Project wide find & replace
  Plug 'ChristianChiarulli/far.vim'
  " Float term
  Plug 'voldikss/vim-floaterm'
  " Startify
  Plug 'mhinz/vim-startify'
  " Git integration
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " FZF integration
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Code linting
  Plug 'dense-analysis/ale'
  " Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Snippets with coc
  Plug 'honza/vim-snippets'
  " Python
  Plug 'jeetsukumaran/vim-pythonsense'
  " REPL
  "Plug 'kassio/neoterm'
  Plug 'echasnovski/neoterm', { 'branch': 'bracketed-paste' }

call plug#end()
