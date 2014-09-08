" zlorfi's vimrc file

" Must come first because it changes other options.
set nocompatible
" lots of command line history
set history=1000

" filetype plugin indent on
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'ingydotnet/yaml-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax on

" Colorscheme
let g:molokai_original = 1
color molokai

" Map <Leader>
let mapleader = "_"

" Add line numbers
set number
set ruler

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

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin
" :au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
set nofoldenable

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location


" set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}\ %=%-16(\ Line:\ %l\ of\ %L\ %)\ %=%-30(%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %)%P
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ Line:\ %l\ of\ %L\ %)\ %=%-30(%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %)%P

" airline Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTreee show hidden files by default
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore=['\.DS_Store']

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

" VimWiki Settings
let g:vimwiki_list = [{'path': '~/.vim/wiki/', 'path_html': '~/.vim/wiki_html/', 'html_header': '~/.vim/wiki_html/header.tpl'}]

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
map <leader>w2h :Vimwiki2HTML
map <leader>wa2h :VimwikiAll2HTML<cr>
map <leader>ll :NERDTreeToggle<cr>
map <leader>lo :NERDTree
map <leader>_ :GundoToggle<cr>
" Marked.app is an Markdown interpreter on MacOS
map <leader>m :silent !open -a Marked.app '%:p'<cr>

map <leader>f :FufFileWithFullCwd<cr>
map <leader>d :FufFileWithCurrentBufferDir<cr>
map <leader>b :FufBuffer<cr>

" NerdComment
map <leader>cc :NERDComInvertComment

" swap word with next word
nmap <silent> gw    "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>

