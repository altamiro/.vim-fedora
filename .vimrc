"""""""""""""""""""""""""""""""""" My VIMRC """"""""""""""""""""""""""""""""""
" vim: et:tw=79:sw=4:ts=4:sts=4
"
" File: ~/.vimrc
" Author: Altamiro Rodrigues <altamiro27 at gmail dot com>
" Copyright: GPLv3
" Description: List of settings for VIM setup

" I don't like \ as a leader.
let mapleader=","

" Plugins
source ~/.vim/plugins.vim

" Some accelerators
let $PLUGINS='~/.vim/plugins.vim'
let $PYTHON='~/.vim/confs/python.vim'

" Mappings
source ~/.vim/mappings.vim
let $MAPPINGS='~/.vim/mappings.vim'

set nocompatible
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
" Enable Syntax highlight
syntax on
" Make vim searching incredible
set hlsearch incsearch smartcase

" Hum... Nice clothes
if has("gui_running")
    "colorscheme jellybeans++ " Sorry, Steve Losh rocks
    colorscheme badwolf+
    " No toolbar or Menu (someone use it?)
    set guioptions-=T
    set guioptions-=m
    " No left and right scrollbar
    set guioptions-=r
    set guioptions-=L
    " I'm currently testing this font...
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
else
    colorscheme desert
endif

" copy and paste with the mouse
set mouse=a
" Shows line numbers
set number
" Always shows the ruler (cursor position and etc)
set ruler
" Shows (partial) command in status line
set showcmd
" Show matching brackets.
set showmatch
" Highlight cursor line
set cursorline
" Tells vim to let 4 lines beforescrolling
set scrolloff=4
" Tells vim to break lines that exceeds the 'textwidth'
set wrap linebreak
" Always shows the status line
set laststatus=2
" Eable folding and set it to use the marker
set foldenable foldmethod=marker
" Set hidden buffers
set hidden
" More powerful backspacing
set backspace=indent,eol,start
" Tells VIM that we are using a fast TTY
set ttyfast
" Keep 200 lines of command line history
set history=200
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes+=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc
set wildignore+=*.bak,~*,*.swp,*.o,*.info,*.aux,*.log,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.pyc
" Remove fillchars
set fillchars=
" Highlight the textwidth+1 column. In python files commonly is the 80th column
set colorcolumn=+1
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Disable backup and swapfile
set nobackup noswapfile
" Fix split positioning
set splitbelow splitright
" Rounds indent to multiple of shiftwidth
set shiftround
" Complet matching text and show list
set wildmode=list:longest
" Disable preview window (faster navigation in completitions)
set completeopt-=preview
" Automatically read a file that has changed on disk
set autoread
set tabstop=4
set shiftwidth=4
set expandtab

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Read again about this Settigns...
" set list listchars=tab:▸,trail:·,nbsp:·,

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/']

" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

let g:pymode_python = 'python3'

" Settigns for specific filetype
augroup filetypedetect
    autocmd BufNewFile,BufRead *.c,*.h setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent nowrap
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType c,cpp,objc,objcpp call rainbow#load()
    autocmd BufNewFile,BufRead *.py source ~/.vim/confs/python.vim
    autocmd vimenter * NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd FileType html,css EmmetInstall
    " Autodestroy fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " autocmd VimEnter * DBCompleteTables
augroup END

" Each profile has the form: dbext.vim
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
" let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5433:dbname=jms:user=jms'
" let g:dbext_default_profile = 'psql'
