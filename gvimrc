" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Source\ Code\ Pro\ for\ Powerline:h16 "make sure to escape the spaces in the name properly
" set guifont=Source\ Code\ Pro:h16
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=L                 " Hide left scrollbar
set guioptions-=l
set guioptions-=r                 " Don't show right scrollbar
set background=light              " Background.
set lines=50 columns=150          " Window dimensions.
"set fullscreen
set fuoptions=maxvert,maxhorz
set transp=1
" let g:molokai_original = 1
" colorscheme molokai
colorscheme solarized

"set cmdheight=2

if has("gui_macvim")
  macmenu File.Print key=<nop>
endif
