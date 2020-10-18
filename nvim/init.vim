" Include current file and any children in the path
set path=.,**

" Plugins
call plug#begin('~\AppData\Local\nvim-data\plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'preservim/nerdtree' " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " Git plugin for file explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting in file explorer
Plug 'ryanoasis/vim-devicons' " File icons
Plug 'airblade/vim-gitgutter' " Git status in gutter
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'scrooloose/nerdcommenter' " Commenting plugin
Plug 'morhetz/gruvbox' " Gruvbox theme
Plug 'vim-airline/vim-airline' " Airline status bar
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'liuchengxu/vim-which-key' " Leader key mappings plugin

call plug#end()

set history=500 " Sets how many lines of history VIM has to remember

set number " Show line numbers

set spell spelllang=en_gb " Enable spell check

set mouse=a " Enable mouse

set clipboard=unnamedplus " Enable clipboard

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

nmap <leader>w :w!<cr> " Fast saving

set so=7 " Set 7 lines to the cursor - when moving vertically using j/k

set wildmenu " Turn on the Wild menu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set ruler "Always show current position

set colorcolumn=100 " Show line length marker

set cmdheight=1 " Height of the command bar

set hidden " A buffer becomes hidden when it is abandoned

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching

set smartcase " When searching try to be smart about cases

set hlsearch " Highlight search results

set incsearch " Makes search act like search in modern browsers

set lazyredraw " Don't redraw while executing macros (good performance config)

set magic " For regular expressions turn magic on

set showmatch " Show matching brackets when text indicator is over them

set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable " Enable syntax highlighting

" Enable gruvbox theme
try
    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'hard'
catch
endtry

set background=dark " Tell VIM background is dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=UTF-8 " Set UTF-8 as standard encoding

set ffs=unix,dos,mac " Use Unix as the standard file type

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set expandtab " Use spaces instead of tabs

set smarttab " Be smart when using tabs

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Navigate buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behaviour when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set laststatus=2 " Always show the status line

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.py,*.sh :call CleanExtraSpaces()
endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Spell check shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Open CoCConfig quickly
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
          \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
          \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig') " Use C to open CoCConfig 

" Prefer Python 3
set pyxversion=3
let g:python3_host_prog = 'C:\Python38\python.exe'

let g:airline_powerline_fonts = 1 " Airline
let g:airline_theme='base16_gruvbox_dark_hard'

" Map j-j and k-k to Escape key
imap jk <Esc>
imap kj <Esc>

" NERDTree key bindings
nmap <C-f> :NERDTreeToggle<CR>

" autocmd VimEnter * NERDTree " Open NERDTree automatically
" Quit VIM if NERDTree is the only split open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
