vim9script
# Don't try to be vi compatible
set nocompatible

# Helps force plugins to load correctly when it is turned back on below
filetype off

# For plugins to load correctly
filetype plugin indent on

# Turn on syntax highlighting
syntax on

const is_win = has('win32')
g:minimal_plugins = v:false
$v = $HOME .. (is_win ? '\vimfiles' : '/.vim')
$VIMSTATE = $HOME .. '/.local/state/vim/'
$VIMRC = $v .. '/vimrc'

# Set map/maplocal leader (with \ and , as aliases)
g:mapleader = "\<Space>"
g:maplocalleader = "\\"

nmap <bslash> <space>
nmap , <space>

nmap <F8> :TagbarToggle<CR>

# Security
set modelines=0

# Show line numbers
set number

# Show file stats
set ruler

# Blink cursor on error instead of beeping (grr)
set visualbell

# Encoding
set encoding=utf-8

# Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

# Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> # use % to jump between pairs
runtime! macros/matchit.vim

# Move up/down editor lines
nnoremap j gj
nnoremap k gk

# Allow hidden buffers
set hidden

# Rendering
set ttyfast

# Status bar
set laststatus=2

# Last line
set showmode
set showcmd

# Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> # clear search

# Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

nnoremap <leader>r :source $MYVIMRC<CR>

# Textmate holdouts

# Formatting
map <leader>q gqip

# Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
# Uncomment this to enable by default:
# set list # To enable by default
# Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> # Toggle tabs and EOL

# Setup plugins
g:loaded_2html_plugin     = 1
g:loaded_getscriptPlugin  = 1
g:loaded_gzip             = 1
g:loaded_logiPat          = 1
g:loaded_manpager_plugin  = 1
g:loaded_rrhelper         = 1
g:loaded_spellfile_plugin = 1
g:loaded_tarPlugin        = 1
g:loaded_vimballPlugin    = 1
g:loaded_zipPlugin        = 1
g:loaded_netrw            = 1
g:loaded_netrwPlugin      = 1

g:load_black = 1
g:loaded_fzf = 1

if exists('#vimrc')
  augroup vimrc
    autocmd!
  augroup END
  augroup! vimrc
endif

source $v/setting.vim

if filereadable($HOME .. '/local.vim')
  source $HOME/local.vim
endif

source $v/pack.vim

# Color scheme (terminal)
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set background=dark
g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', 'charvaluehex'  ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B'
  \ },
  \ 'mode_map': {
        \ 'n': 'N',
        \ 'i': 'I',
        \ 'R': 'R',
        \ 'v': 'V',
        \ 'V': 'VL',
        \ "\<C-v>": 'VB',
        \ 'c': 'C',
        \ 's': 'S',
        \ 'S': 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
  \ }
g:solarized_termcolors = 256
g:solarized_termtrans = 1

# try
#   colorscheme powerline
# catch
#   try
#     colorscheme wombat
#   catch
#     colorscheme solarized
#   endtry
# endtry

# vim:fdm=marker:fmr=[[[,]]]:ft=vim
