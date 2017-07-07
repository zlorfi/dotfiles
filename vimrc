" zlorfi's vimrc file

" Must come first because it changes other options.
set nocompatible
" lots of command line history
set history=1000

" filetype plugin indent on
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
" Plugin 'garbas/vim-snipmate'
" Plugin 'ingydotnet/yaml-vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'pangloss/vim-javascript'
" Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/gundo.vim'
" Plugin 'tomtom/tlib_vim'
" Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'vim-scripts/tComment'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax on

" Colorscheme
if &term == "xterm"
  set t_Co=256
endif
let g:molokai_original = 1
color molokai

" Map <Leader>
let mapleader = "_"

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
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}\ %=%-16(\ Line:\ %l\ of\ %L\ %)\ %=%-30(%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %)%P
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ Line:\ %l\ of\ %L\ %)\ %=%-30(%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %)%P

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme='murmur'
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

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }
let g:ctrlp_map = '<c-p>'

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
map <leader>ll :NERDTreeToggle<cr>
map <leader>lo :NERDTree<cr>
map <leader>_ :GundoToggle<cr>
" Marked.app is an Markdown interpreter on MacOS
map <leader>m :silent !open -a Marked.app '%:p'<cr>

" Buffer switching
map <leader>p :bp<cr> " \p previous buffer
map <leader>n :bn<cr> " \n next buffer
map <leader>d :bd<cr> " \d delete buffer

" NerdComment
map <leader>cc :NERDComInvertComment<cr>

" swap word with next word
nmap <silent> gw    "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>
