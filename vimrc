" Pathogen
call pathogen#infect()
syntax enable
filetype plugin indent on

"--------------------------------------------------------------------------
" Features
"--------------------------------------------------------------------------
" use vim settings, rather than vi settings
set nocompatible

" enable syntax highlighting
syntax on

" colour scheme
"colorscheme koehler

" Especially for Ubuntu
set background=dark

" allows switching from unsaved buffers without saving first
set hidden

" tab autocompletion in the command space
set wildchar=<TAB>
set wildmenu
set wildmode=longest,full

" filetype specific commands
filetype indent plugin on
autocmd FileType make :set noexpandtab
autocmd FileType c :set cindent
autocmd FileType tex :set spell
autocmd FileType html :set textwidth=0 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufReadPost *.log :set filetype=messages

" abbreviations for convenience
iab #i #include
iab #d #define
iab perr fprintf(stderr, "%s:%d:\n", __FILE__, __LINE__);<ESC>23ha

"--------------------------------------------------------------------------
" Usability options
"--------------------------------------------------------------------------
" allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" number of lines remembered in the command line history
set history=50

" show matching bracket briefly after one is inserted
set showmatch

" stop certain movements from always going to the first character of a line
set nostartofline

" enable the use of mouse for all modes
"set mouse=a
set mouse=r

" display the name of the file currently being edited in the title
set title

" display line numbers
set number

" shows line/column information for the current cursor position
set ruler

" shows partial commands in the last line of the screen
set showcmd

" always display the status line, even if only one window is displayed
set laststatus=2

" set the command window height to 2 lines
"set cmdheight=2
set cmdheight=1

" use visual bell instead of beeping when doing something wrong
set visualbell

" if visual bell is set, vim will neither flash nor beep
set t_vb=

" highlights searches
set hlsearch

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" set incremental searching
set incsearch

"--------------------------------------------------------------------------
" Indentation, wrapping and folding
"--------------------------------------------------------------------------
" indentation settings for 4 spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set expandtab

" indentation settings for using hard tabs as indent
"set shiftwidth=4
"set tabstop=4

" keep the same indenting as the previous line when starting a new line
set autoindent

" round indents off to shiftwidth
set shiftround

" turn off text wrapping
set nowrap

" mark lines with a character that exceed 80 characters
set listchars+=extends:+

" maximum allowable line length
set textwidth=79

" code folding
set foldmethod=syntax
set foldlevelstart=99

"--------------------------------------------------------------------------
" Mappings
"--------------------------------------------------------------------------
" map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

" map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" map <F2> to open .vimrc config file
map <F2> :e ~/.vimrc<CR>
"map <F2> :e ~/_vimrc<CR>

" map <F3> to do a printed word count for a tex document
map <F3> :w !untex -e -o - \| wc -w<CR>

" map <F4> to 'make' (skips output)
map <F4> :make<CR><CR><CR>

" map <F5> to 'make'
map <F5> :make<CR>

" use <F11> to toggle between auto-indenting for code paste
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode

" map '\w' to toggle line wrapping
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        set textwidth=79
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        set textwidth=0
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>

        " override normal J, K, 0, $
        noremap  <buffer> <silent> k gk
        noremap  <buffer> <silent> j gj
        noremap  <buffer> <silent> 0 g0
        noremap  <buffer> <silent> $ g$
    endif
endfunction

"--------------------------------------------------------------------------
" Other options
"--------------------------------------------------------------------------
" mintty specific cursors when in normal and insert mode
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" gvim specific options
"colorscheme desert
"set imdisable
"set guifont=Consolas:h11:cANSI
"autocmd GUIEnter * set visualbell t_vb=
"set lines=45 columns=85
"set directory=.,$TEMP
"set clipboard=unnamed

" highlighting for .xlsx and .axlsx
au BufNewFile,BufRead *.xlsx.axlsx set filetype=ruby

" trailing whitespaces
"autocmd BufWritePre * :%s/\s\+$//e
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
