""""
" Basic Configuration
""""

set nocompatible " Disable vi interworking mode for being improved

" Replace ":" with ";"
noremap ; :
noremap : ;

set nowrap " no wrap
set hidden " Allow to move buffer without save
set vb t_vb= " Disable beep
set backspace=indent,eol,start " Enable backspace to deleter all stuff

" For interworking with OS
set mouse=a " Enable Mouse
" set clipboard+=autoselect "
set clipboard+=unnamed 

" Show line number
set number
set numberwidth=6 " fixed width

" Color Syntax
syntax enable
set background=dark

" Cursor Line
set cursorline
highlight clear CursorLine " Disable under_line
highlight CursorLine ctermbg=gray guibg=gray

" Highlight only buffer on focus
augroup cch
 autocmd! cch
 autocmd WinLeave * set nocursorline
 autocmd WinEnter,BufRead * set cursorline
augroup END

" edit/apply .vimrc as Ev Av
command! Ev edit $MYVIMRC
command! Av source $MYVIMRC

""" 
" For sharing .vimrc by Dropbox
"""

" change swap file directory
set swapfile
set directory=~/.vimswap
" change backup file directory
set backup
set backupdir=~/.vimbackup

"""
" Status Line
"""

set laststatus=2 " Always show status line
set ruler

"""
" Key binding
"""

" Spase/shift-Space as Scroll
nnoremap <SPACE> <PageDown>
nnoremap <S-SPACE> <PageUp>

" Enable Ctrl-z as Undo
nnoremap <C-z> u

"""
" Move
"""

" Function Key
map <F2> <ESC>;bn<CR> " Goto Next Buffer
map <F3> <ESC>;bp<CR> " Goto Previous Buffer
map <F4> <ESC>;bw<CR> " Delete current Buffer
" call togglebg#map("<F5>") 

" Buffer 
map <C-k> <C-w>k " Move up 
map <C-j> <C-w>j " Move down

"""
" Current Directory 
"""

" CAUTION:disable autochdir if you use tag 
set autochdir " Change Direcotry automatically for current buffer

"
" Move current directory manually
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>


"""
" Edit
"""

" Disable IME after exiting Insert mode
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>;set iminsert=0<CR>

"""
" Plugin
"""

let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
    " 読み込まない
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#rc(s:bundle_root)

    " NeoBundle自身をNeoBundleで管理させる
    NeoBundleFetch 'Shougo/neobundle.vim'

    " 非同期通信を可能にする
    " 'build'が指定されているのでインストール時に自動的に
    " 指定されたコマンドが実行され vimproc がコンパイルされる
    NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}

    " (ry

    " インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck
endif

filetype plugin indent on

###
# Color Scheme
###
colorscheme morning

syntax on

