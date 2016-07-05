" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" for running pathogen
call pathogen#infect()

" use 256 colors in gnome terminal
if $COLORTERM == 'gnome-terminal'
	  set t_Co=256
  endif

" display status line (and airline) always
set laststatus=2

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
  "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

"set cursor to last visited position when reopening a file
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END"")"'")

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Show line numbers
set number

" auto indent
set autoindent

" highlight search results
set hlsearch

" ignore cases by default when searching
set ignorecase

" Show Latex buttons in GVim when opening a tex-file
filetype plugin on
if has('gui_running')
  set grepprg=grep\ -nH\ $*
  filetype indent on
  let g:tex_flavor='latex'
endif

" Forward Search for compiled pdf documents in latex
function SyncTexForward()
	let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &"
	exec execstr
endfunction
" Map "Compile Document" and "Forward Search" to \f
nmap <Leader>f <leader>ll :call SyncTexForward()<CR>

" create .pdf immediately from .tex
filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
"let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'arara -v $*'
 let g:Tex_MultipleCompileFormats = 'pdf'
 let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
 let g:Tex_GotoError = 0
 let g:Tex_ViewRule_pdf = 'evince'
" let g:Tex_CompileRule_pdf = 'mkdir -p latexCompileFiles && pdflatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'
" let g:Tex_CompileRule_pdf = 'mkdir -p out && pdflatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'

" make <c-u> and <c-w> undoable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
