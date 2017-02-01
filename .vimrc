set nocompatible
set backspace=indent,eol,start
set showcmd

execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256

set grepprg=grep\ -nH\ $*

"set nowrap
set tabstop=4
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set expandtab
set smarttab
set hlsearch

set wildmenu
set wildmode=list:longest,full
set mouse=a "for people that need to use my editor

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

set pastetoggle=<F2>
set nohidden

"navigation mapping
inoremap jj <Esc>
inoremap kk <Esc>
inoremap JJ <Esc>
inoremap KK <Esc>
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
nnoremap <space>bd :w<CR> :bd<CR>

"git stuff
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<CR><CR>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

nmap <silent> ,/ :nohlsearch<CR>

"Tag list
nnoremap <space>ta :TagbarToggle<CR>

"NERD tree
let NERDTreeShowHidden=1
nnoremap <space>cd :NERDTreeToggle<CR>

"Tabs
nnoremap <space>q 1gt
nnoremap <space>w 2gt
nnoremap <space>e 3gt
nnoremap <space>r 4gt
nnoremap <space>k gt
nnoremap <space>j gT

map <leader>bta :!/usr/local/bin/ctags -R .<CR>

set tags=tags;/
set laststatus=2

"Lightline
let g:lightline = {
        \'colorscheme': 'wombat',
        \'subseparator': {'left': '|', 'right': '|'},
        \'active':{
        \   'left':[ ['mode'],['fugitive','filename'] ]
        \},
        \'component_function': {
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype'
        \}
\}

function! LightlineModified()
    if &ft == "help"
        return ""
    elseif &modified
        return "᯼""
    else
        return ""
    endif
endfunction

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '📙' : ''
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ substitute(expand('%:h'),"/"," > ","g") .
        \('' != expand('%:t') ? ' > ' . substitute(expand('%:t'), 'NERD.*','[Directory]','g') : '[Untitled]') .
        \('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

"Colorscheme based on filetype
"colorscheme brookstream
color railscasts
"colorscheme molokai
autocmd BufEnter *.java colorscheme railscasts

"For html files

"For yaml files
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"For markdown
autocmd BufRead,BufNew *.md set filetype=markdown

"Folding

"Syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript
"white space trimmer
autocmd BufWritePre * :%s/\s\+$//e

"crosshairs

hi CursorColumn cterm=bold ctermbg=none
hi CursorLine cterm=bold ctermbg=none
set cursorline
set cursorcolumn
