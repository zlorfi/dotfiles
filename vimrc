" zlorfi's vimrc file

" Must come first because it changes other options.
set nocompatible
" lots of command line history
set history=1000

" filetype plugin indent on
filetype off

" Load vim-plug if not already installed
if empty(glob("~/.vim/autoload/plug.vim"))
  " Ensure all needed directories exist
  execute 'mkdir -p ~/.vim/bundle'
  execute 'mkdir -p ~/.vim/autoload'
  " Download the actual plugin manager
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')

" Show git status in the gutter
Plug 'airblade/vim-gitgutter'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Elixir support
Plug 'elixir-lang/vim-elixir'
" Tab support
Plug 'ervandew/supertab'
" autocomplete brackets
Plug 'jiangmiao/auto-pairs'
" Undo
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Search with ack
Plug 'dyng/ctrlsf.vim'
" Comment function
Plug 'scrooloose/nerdcommenter'
" Filebrowser, load on first invocation of 'NERDTreeToggle'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Language packs
Plug 'sheerun/vim-polyglot'
" Add comments via gcc or gc
Plug 'tpope/vim-commentary'
" Wisely add 'end' in Ruby
Plug 'tpope/vim-endwise'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Statusline
Plug 'vim-airline/vim-airline'
" Statusline themes
Plug 'vim-airline/vim-airline-themes'
" Linter
" Plug 'w0rp/ale'
" Solalized Theme
Plug 'altercation/vim-colors-solarized'
" JSX and Javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Initialize plugin system
call plug#end()

" Colorscheme
if &term == "xterm"
  set t_Co=256
endif
" let g:molokai_original = 1
" colorscheme molokai
set background=light
colorscheme solarized

" set default shell
set shell=/bin/bash

" Map <Leader>
nnoremap <SPACE> <Nop>
let mapleader = " "

" Add line numbers
set number
set ruler

" ruler at 120 characters
if (exists('+colorcolumn'))
  set colorcolumn=120
  highlight ColorColumn ctermbg=8
endif

" Set encoding
set encoding=utf-8
setglobal fileencoding=utf-8

" Autoindent
set autoindent
set smartindent

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Whitespace stuff
" set nowrap
set wrap linebreak nolist
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" SET Font
" set guifont=Menlo\ Regular:h14
set guifont=Source\ Code\ Pro\ for\ Powerline:h14 "make sure to escape the spaces in the name properly

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Set the terminal's title
set title

" No beeping.
set visualbell

" Set autocompletion on startup
let g:deoplete#enable_at_startup = 1

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Highlight characters behind the 80 chars margin
" :au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
set nofoldenable

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" highlite active line
set cursorline

set laststatus=2                  " Show the status line all the time

" persistent undo
if has("persistent_undo")
  set undodir=/$HOME/.vim/tmp/
  set undofile
endif

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
" let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3v'
" let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTreee show hidden files by default
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore=['\.DS_Store']

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" keep ALE gutter open at all times
let g:ale_sign_column_always = 1

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.rabl} set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>
" split window navigation
map <leader>ws :sp<cr>
map <leader>w/ :vsp<cr>
" equalize all window sizes
map <leader>w= <C-W>=<cr>
map <leader>wd <C-W>c<cr>
map <leader>w<up> <C-W><C-K><cr>
map <leader>w<down> <C-W><C-J><cr>
map <leader>w<right> <C-W><C-L><cr>
map <leader>w<left> <C-W><C-H><cr>
map <leader>ll :NERDTreeToggle<cr>
map <leader>ww :NERDTreeFocus<cr>
" no <cr> at the end to be able to submit bookmark
map <leader>lo :NERDTree<SPACE>
map <leader>_ :UndotreeToggle<cr>

" Buffer switching
map <leader>p :bp<cr> " \p previous buffer
map <leader>n :bn<cr> " \n next buffer
map <leader>d :bd<cr> " \d delete buffer
map <leader>b :buffers<cr>:buffer<Space>

" swap word with next word
nmap <silent> gw    "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>

" bind ag(the_silver_searcher) to ack
let g:ackprg = 'ag --vimgrep'

" ctrlsf.vim plugin options
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>F <Plug>CtrlSFVwordExec
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_focus = { "at": "done", "duration_less_than": 2000 }

" use fuzzy finder
nnoremap <c-t> :GFiles -co --exclude-standard -- ':!:*.jpeg' ':!:*.jpg' ':!:*.pdf' ':!:*.png' ':!:*.svg' ':!:*.ttf' ':!:.*.woff' ':!:.*.woff2'<CR>
