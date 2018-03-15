""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'   " fuzzy find files
Plugin 'scrooloose/nerdtree'  " file drawer, open with :NERDTreeToggle
Plugin 'scrooloose/syntastic' " syntax checking plugin for Vim.
Plugin 'tpope/vim-fugitive'   " Ultimate Git helper
Plugin 'airblade/vim-gitgutter' " shows a git diff in the gutter 
Plugin 'bling/vim-airline'    " Pretty vim status bar
Plugin 'vim-airline/vim-airline-themes' " Theme for airline
"Plugin 'xolox/vim-misc'       " Required by easytags.
"Plugin 'xolox/vim-easytags'   " Automated tag file generation and syntax highlighting of tags
Plugin 'godlygeek/tabular'    " Easy formatting to the same column width
Plugin 'tpope/vim-surround'   " Easily add/change surroundings
Plugin 'scrooloose/nerdcommenter'  " Comment whatever
Plugin 'skwp/greplace.vim'    " Simple grep and replace in quickfix window


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ

" Greplace Usage:
"    1. Use :Gsearch to get a buffer window of your search results
"    2. then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
"    3. Invoke :Greplace to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
"    4. Save changes to all files with :wall (write all)


""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""

" To move to a misspelled word, use ]s and [s. The ]s command will move the
" cursor to the next misspelled word, the [s command will move the cursor back
" through the buffer to previous misspelled words.
" Once the cursor is on the word, use z=, and Vim will suggest a list of
" alternatives that it thinks may be correct.
"set spell spelllang=en_us

" The default clipboard register is the * reg. The unnamed or " - double quote
" register is the default register. Everything that yanked or changed,
" deleted, etc. is placed in the unnamed reg. Setting clipboard to unnamed
" means every yank and delete etc. will clobber the system clipboard. Instead I
" defined mappings to yank and paste to the * register (default) with leader c
" and leader v. See below...
"set clipboard=unnamed

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set showmode        " Display the mode you're in.

set wildmenu        " Enhanced command line completion.

set wildmode=list:longest         " Complete files like a shell.

set number          " Show line numbers.

set relativenumber  " Show relative numbers

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=t,c,q,o,r,n,j " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " t         Auto-wrap to limit by textwidth
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " n         recognize numbered lists
                    " j	        Where it makes sense, remove a comment leader
                    "           when joining lines.

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.
set ttymouse=xterm2

set directory=~/tmp,/var/tmp,/tmp  " By setting the 'directory' option you can place the swap
                    " file in another place than where the edited file is.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

syntax on           " Enable syntax highlighting

set visualbell      " Use visual bell instead of beeping when doing something wrong

"set cmdheight=2    " Set the command window height to 2 lines, to avoid many 
" cases of having to press <Enter> to continue"

"set matchtime=5    " how many tenths of a second to blink matching brackets for

set laststatus=2    "To display the status line always

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Sets how many lines of history VIM has to remember
set history=100  " default 20

" For regular expressions turn magic on
set magic   " Magic on should be default but to make sure

" When you use :set list it will show tabs and everything but spaces as
" something
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set timeoutlen=500
"set ttimeoutlen=0

" Turn on globstar for external vim commands
set shell+=\ -O\ globstar

set cursorline

" set cursorline colors
highlight cursorline term=bold cterm=NONE ctermbg=236 ctermfg=none

" set color of number column on cursorline
highlight cursorlinenr ctermbg=235 ctermfg=white

" Highlights the current line number
highlight linenr term=bold cterm=none ctermfg=darkgrey ctermbg=none gui=none guifg=darkgrey


""""""""""""""""""""""""""""""""""""""""
" Remapping
""""""""""""""""""""""""""""""""""""""""

let mapleader=' '   " Set leader key to space

inoremap jk <Esc>

" Window moving
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Allow saving of files as sudo when I forget to start vim using sudo.
cnoremap w!! w !sudo tee "%" > /dev/null
nnoremap <Leader>so :w !sudo tee "%" > /dev/null<CR>

" Save files faster
nnoremap <Leader>s :w<CR>

" Save As ...  See help expand for modifiers like :h
nnoremap <Leader>sa :w %:h/

" turn off search highlight
nnoremap <leader>l :nohlsearch<CR>

" Substitute command in "very magic" mode by adding \v aka grep extended
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/\v

" New files
nnoremap <Leader>n :new<CR>
nnoremap <Leader>nv :vnew<CR>

" Substitute command colon separated shortcut
noremap <Leader>; :s:\v::g<Left><Left><Left>
noremap <Leader>' :%s:\v::g<Left><Left><Left>

" Edit and source vimrc file
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

if filereadable(expand("~/dotfiles/vim/bundle/nerdcommenter/plugin/NERD_commenter.vim"))
    " nerdcommenter paragraph
    nnoremap <Leader>cp Vip:call NERDComment("x", "Comment")<CR>
    nnoremap <Leader>up Vip:call NERDComment("x", "Uncomment")<CR>
else
    " Comment lines or paragraph with //
    nnoremap <Leader>cl mzI//<esc>'z
    nnoremap <Leader>cp mzVip:s/^\s*\zs\ze/\/\// <bar>nohl<cr><esc>'z

    nnoremap <Leader>ul mzV:s/\%V\(\s*\)\/\//\1<cr>'z
    nnoremap <Leader>up mzVip:s/\%V\(\s*\)\/\//\1<cr>'z:nohl<cr>

    vnoremap <Leader>cl mz:s/^\s*\zs\ze/\/\/<cr>'z
    vnoremap <Leader>ul mzV:s/\%V\(\s*\)\/\//\1<cr>'z
endif

" Insert php var_dump() and die() for debugging
noremap <Leader>d oecho '<pre>';var_dump();echo '</pre>';die('here');kk0f(a
noremap <Leader>e oerror_log(print_r(, true));0f,i

" Get currend word count
nnoremap * *<C-O>:%s///gn<CR>
" Search visual selection and show count
vnoremap // y:%s/<C-R>"//gn<CR>

" Add getter and setters for properties
nnoremap <f1> 0/private\<bar>protected\<bar>publicww"zywjmqGo?}dGopublic function set "zpbhx~A($"zpA){	$this->"zpA = $"zpA;return $this;}<<oo	public function get "zpbhx~A(){	return $this->"zpA;}}V(((((='q

" Shortcut for nerdTree
nnoremap <f2> :NERDTreeToggle<CR>

" Open nerdTree to current file location
nnoremap <Leader>f :NERDTreeFind<CR>

" run php on current buffer
if $OS == 'Windows_NT'
    nnoremap <f3> :!php `cygpath -w %` <CR>
else
    nnoremap <f3> :!php % <CR>
endif

" run python3 on current buffer
nnoremap <f4> :!python3 % <CR>

" Convert dos to unix
nnoremap <f5> :update <bar> :e ++ff=dos <bar> :setlocal ff=unix <CR>

" Convert unix LF Fileformat to dos CR/LF
nnoremap <f6> :update <bar> :e ++ff=dos <CR>

" Toggle on/off spell checker
nnoremap <f7> :setlocal spell! spelllang=en_us <CR> 

" Remove trailing whitespace
nnoremap <silent> <f8> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Convert tabs to space
nnoremap <f9> :retab <CR>

set pastetoggle=<F10>

" Sort a list of words
vnoremap <leader>ss d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>
nnoremap <leader>ss :execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Unjoin lines
vnoremap <leader>uj :'<,'>s/ /\r/g <Bar> :nohl <CR>
noremap <leader>uj :s/ /\r/g <Bar> :nohl  <CR>

" Yank whole file to system clipboard
nmap <Leader>a :%y*<CR>

" Paste from system clipboard
nnoremap <Leader>v "*P
vnoremap <Leader>v "*P
"inoremap <Leader>v <C-r><C-p>*

" Copy to system clipboard
nnoremap <Leader>c "*Y
vnoremap <Leader>c "*y

" Yank line w/o line return to clipboard
nnoremap yil ^vg_"*y
" Select "in line"
nnoremap vil ^vg_

" Copy to clipboard current file path
nnoremap <Leader>cf :let @*=expand("%:p")<CR>
nnoremap <Leader>cfr :let @*=expand("%")<CR>
nnoremap <Leader>yf :let @"=expand("%:p")<CR>

" Open command-line window for editing comman history or search history.
" Use: q: or q/ respectively
" Or press CTRL-F in command or search mode to switch to it

" Undo/Redo chronologically regardless of undo branching
"nnoremap <Leader>u :earlier<CR>
"nnoremap <Leader>r :later<CR>

" Find and replace in multiple files using arglist
":args `grep -l findme application/`
":argdo %s/findme/replacement/gc
":argdo update 

"""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""

" need it for airline symbols
set encoding=utf-8

" airline settings
let g:airline#extensions#syntastic#enabled=1
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'ξ'
"let g:airline_theme='solarized'

" Netwr options
"let g:netrw_banner = 0         " Turn off banner
"let g:netrw_liststyle = 3      " Tree view
let g:netrw_browse_split = 4   " Preview mode
"let g:netrw_browse_split = 2   " Open vertically split
let g:netrw_altv = 1
let g:netrw_winsize = 25       " Size 25% of window

function Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python'
endfunction

function Py3()
    if $OS == 'Windows_NT'
      let g:syntastic_python_python_exec = '/usr/bin/python3'
    else
      let g:syntastic_python_python_exec = '/usr/local/bin/python3'
    endif
endfunction

call Py3()   " default to Py3 because I try to use it when possible
