" dein {{{
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" }}}
" common {{{1
syntax on

set modeline
set modelines=3

set swapfile
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup

"tabstop系
set tabstop=2
set softtabstop=2
set shiftwidth=2 
set expandtab shiftwidth=2

"アンドゥの永続化
set undofile
set undodir=~/.vim/tmp
set undolevels=200

colorscheme hybrid

set incsearch
set ignorecase
set smartcase

set wildmenu wildmode=list:full
set number
set laststatus=2
set mouse=a

"カーソル変更 {{{2
if has('win32unix')
  let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
  let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
  let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
  let &t_te .= "\e[0 q"  " termcap モードから抜ける
endif
"}}}

"文字コード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

"位置記憶
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"折りたたみ
" カーソルが移動した時に自動で折りたたみを開く
 set foldopen=block,hor,mark,percent,quickfix,search,tag,undo


" matchitの有効化 
source $VIMRUNTIME/macros/matchit.vim

" オートインデントモードでインデントを削除できるように
set backspace=start,eol,indent

" }}}
"common keybind {{{1
"QuickFix --> uniteにしちゃった…
"nnoremap [q :UnitePrevious<CR>   " 前へ
"nnoremap ]q :UniteNext<CR>       " 次へ
"nnoremap [Q :<C-u>UniteFirst<CR> " 最初へ
"nnoremap ]Q :<C-u>UniteLast<CR>  " 最後へ
"autocmd QuickFixCmdPost *grep* cwindow

"tab切り替え系 
 nnoremap <F2> gT
 nnoremap <F3> gt

" tagsジャンプの時に複数ある時は一覧表示                                        
 nnoremap <C-]> g<C-]> 

"Windows
nnoremap <C-Tab> 
nnoremap <C-Left> h
nnoremap <C-Right> l
nnoremap <C-Up> k
nnoremap <C-Down> j
set splitright
set splitbelow
"}}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
