" Load pathogen
execute pathogen#infect()

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

set shiftwidth=2
set tabstop=2
" Why is this not a default
set hidden

set showfulltag

set guioptions=ac
" Don't update the display while executing macros
set lazyredraw

set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
" tell Vim to always put a status line in, even if there is only one
" " window
set laststatus=2
set ch=2
" At least let yourself know what mode you're in
set showmode
set showcmd

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" File type dependent options
if has("autocmd")
	" Disable visual and audio bell
	autocmd VimEnter * set vb t_vb=
	
	" Enable file type detection, plugins, and indentation rules.
	filetype plugin indent on
	autocmd FileType text setlocal textwidth=80
	" The above doesn't include this.
"	autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
"	autocmd BufNewFile,BufRead *.tex set filetype=tex
"	autocmd BufNewFile,BufRead *.cellgen set filetype=c
	autocmd BufNewFile,BufRead *.spl set filetype=spl
	autocmd BufNewFile,BufRead *.splmm set filetype=spl
	autocmd BufNewFile,BufRead *.cgt set filetype=cpp
	" When editing a file, always jump to the last known cursor position.
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ 	execute "normal g`\"" |
		\ endif
endif



if has("gui_running")
	set guifont=Monaco:h14
	colorscheme ir_black
	set background=dark
endif
