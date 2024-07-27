call plug#begin('~/.local/share/nvim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim',{'branch':'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()


"init.vim
lua << EOF
local ls = require'luasnip'

ls.snippets = {
  cpp = {
    ls.parser.parse_snippet("snip", [[
#include<bits/stdc++.h>
using namespace std;
#define int long long 
#define FAST_IO ios_base::sync_with_stdio(false); cin.tie(0);

void solve() {
}

signed main(){
    FAST_IO
    int t;cin >> t;
    while(t--)solve();
}
]])
  }
}
EOF





lua require'nvim-treesitter.configs'.setup{}
colorscheme retrobox
"autocmd VimEnter * hi Normal guibg=none
syntax on
let $FZF_DEFAULT_OPTS='--color=16'
let mapleader = "\<Space>"
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set rnu
set nu
set smartindent
set autoindent
set smartcase 
set ignorecase 
set termguicolors
filetype plugin indent on

highlight StatusLine ctermfg=250 guifg=#ffffff guibg=#010101
set statusline=%<%f\   " File path
set statusline+=%h%m%r%=%-14.(%l,%c%V%)\ %P " Modes, file info, and percent through the file

"removes the ~
set backspace=indent,eol,start
set background=dark

"horizontal split
nnoremap <leader>sh <C-w>s

"vertical split
nnoremap <leader>sv <C-w>v 


" tab operations
nnoremap <leader>o :tabnew<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>x :tabclose<CR>

"clear highlight
nnoremap <leader>xh :nohlsearch<CR>

"opens vertical netrw
nnoremap <Leader>v :Vex<CR>
nnoremap <Leader>e :Ex<CR>


nnoremap x "_x

"bg=none
nnoremap <leader>bg :hi Normal guibg=none<CR>

" changes current directory (must be executed before <leader>cs) 
nnoremap <silent> <Leader>cd :cd %:p:h<CR>:pwd<CR>

"writes current buffer then executes c++ file in a vertical split
nnoremap <leader>cs :w<CR>:vert terminal g++ -o %:r % && ./%:r<CR>

" allows copy and pasting (must have a clipboard service)
set clipboard+=unnamedplus

"fzf
noremap <leader>ff :FZF<CR>
nnoremap <silent><leader>fp :Files<CR>

"source ~/.config/nvim/coc.vim
