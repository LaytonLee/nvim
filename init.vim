" 基础配置
set number
set hls
set encoding=utf-8

" 缩进设置
set shiftwidth=4                " 设置格式化时代码缩进为2个空格
set tabstop=4                   " tab键缩进为4格子
set expandtab                   " tab键转换为空格
set softtabstop=0               " 关闭softtabstop 永远不要将空格和tab混合输入
set smartindent                 " 智能缩进
autocmd FileType coffee,html,css,xml,yaml,json set sw=2 ts=2    " 对特定文件设置tabstop=2

set incsearch                   " 开启实时搜索功能
set ignorecase                  " 搜索时大小写不敏感
set wildmenu                    " vim 自身命令行模式智能补全
let mapleader="\<Space>"
" 代码折叠
set nofoldenable
"set foldmethod=indent
set foldmethod=syntax

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :


" U/J keys for 5 times u/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" 9 key: go to the start of the line
noremap <silent> 9 0
" 0 key: go to the end of the line
noremap <silent> 0 $

" Faster in-line navigation
noremap 2 5w
noremap 1 5b

" 语法高亮
syntax on
syntax enable



" ====================== vim-plug ======================
call plug#begin('~/.vim/plugged')
" theme
Plug 'ajmwagar/vim-deus'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 目录树
Plug 'preservim/nerdtree'
" auto completion
" Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim'
" Initialize plugin system
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()
" ======

" ====================== coc extensions ======================
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-jedi',
    \ 'coc-java',
    \ ]

" deus theme
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

" airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" 显示行号
" let NERDTreeShowLineNumbers=1
" let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" plugin jedi
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"

" plug indent
let g:indentLine_enabled = 1    " 使插件生效
let g:indentLine_setColors = 0

" snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



let g:coc_snippet_next = '<tab>'

" ===================== Super Tab =======================
let g:SuperTabDefaultCompletionType = "<c-n>"

 " ===================== fzf =======================
nnoremap <silent> <Leader>fz :Files<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
