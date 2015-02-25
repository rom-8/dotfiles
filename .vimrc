"NeoBundle {{{1

"NeoBundle Setting{{{2
"デフォルトプロトコル変更
let g:neobundle_default_git_protocol='https'
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"}}}
 
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
"Unite Setting {{{2

" insert modeで開始しない(デフォルト)
let g:unite_enable_start_insert = 0

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer -start-insert<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>

nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,ul :<C-u>Unite -buffer-name=search line -start-insert -no-quit -winheight=15<CR>

NeoBundle 'osyo-manga/unite-qfixhowm'
nnoremap <silent> ,uh :<C-u>Unite qfixhowm/new qfixhowm:nocache -hide-source-names<CR>

NeoBundle 'tsukkee/unite-tag' 
nnoremap <silent> ,ut :<C-u>Unite tag -start-insert<CR>


"カレントがgitプロジェクトか判断してコマンドを切り替え
function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git -start-insert
  else
    Unite file_rec/async -start-insert
  endif
endfunction
nnoremap <silent> ,uF :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>

NeoBundle 'lambdalisue/unite-grep-vcs'

"カレントがgitプロジェクトか判断してコマンドを切り替え
function! DispatchUniteGrepOrGrepGit()
  if isdirectory(getcwd()."/.git")
    Unite grep/git -no-quit -winheight=15
  else
    Unite grep -no-quit -winheight=15
  endif
endfunction
nnoremap <silent> ,ug :<C-u>call DispatchUniteGrepOrGrepGit()<CR>

NeoBundle 'Shougo/neomru.vim'

"}}}


NeoBundle 'scrooloose/nerdtree'
" nerdtree setting {{{2
"隠しファイルを表示する。
let NERDTreeShowHidden = 1 
" }}}

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim' "コメントアウトプラギン <C-/><C-/>
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

NeoBundle 'osyo-manga/vim-over'
nnoremap <silent> ,o :OverCommandLine<CR>

NeoBundle 'LeafCage/yankround.vim'
" yankround setting {{{2
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 40
"}}}
NeoBundle 'itchyny/lightline.vim'
source ~/.vimrc_lightline

NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'
"" qfixhowm {{{2
" g,<space> 
" その日の日付でファイルが作成される。 
" 二度目もそのファイルが開かれるので、ぱっとだしやすい
" g,m 
" 最近閲覧、更新したエントリ一覧を表示
" g,g 
" grepする（howm保存ディレクトリ配
" ファイル拡張子をmdにする
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
" ファイルタイプをmarkdownにする
let QFixHowm_FileType = 'markdown'
" タイトル記号
let QFixHowm_Title = '#'
" タイトル行検索正規表現の辞書を初期化
let QFixMRU_Title = {}
" MRUでタイトル行とみなす正規表現(Vimの正規表現で指定)
let QFixMRU_Title['mkd'] = '^###[^#]'
" grepでタイトル行とみなす正規表現(使用するgrepによっては変更する必要があります)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
" }}}
NeoBundle 'Shougo/neocomplete'
" neocomplete {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }}}
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" neosnippet {{{2
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

"vimのスタート画面を豪華に
NeoBundle 'mhinz/vim-startify'
" vim-startify setting {{{2

" 表示数
let g:startify_files_number = 15

" startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
let g:startify_custom_header =
  \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.gitconfig',
  \ ]
"ディレクトリの移動
let g:startify_change_to_dir = 1
"プロジェクトのルートディレクトリへ
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = [
  \ 'howm',
  \ ]
" }}}

NeoBundle 'soramugi/auto-ctags.vim'
" auto-ctags Setting {{{2

"自動でCtags生成 手動は:Ctags
let g:auto_ctags = 1
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.git/tags,.svn/tags
" }}}

"イカスインクリメンタルサーチ
NeoBundle 'haya14busa/incsearch.vim'
"incsearch setting {{{2
"<Tab>/<S-Tab>で前後のマッチに移動できる
" 画面内に目的地がないと判断すれば一気にスキップして画面外の次のマッチに飛べる(<C-j>/<C-k>)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" hlsearch を自動で消す
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"}}}2

NeoBundle "airblade/vim-rooter"
" vim-rooter setting {{{2
if ! empty(neobundle#get("vim-rooter"))
  " Change only current window's directory
  let g:rooter_use_lcd = 1
  " files/directories for the root directory
  let g:rooter_patterns = ['tags', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', 'Makefile', 'GNUMakefile', 'GNUmakefile', '.svn/']
  " Automatically change the directory
  autocmd! BufEnter *.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js :Rooter
endif
" }}}

NeoBundle "sjl/gundo.vim"
nnoremap <F5> :GundoToggle<CR>

NeoBundle 'mattn/emmet-vim'

" テキストオブジェクトで置換
NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'kana/vim-operator-replace.git'
"vim-operator-replace setting {{{2
" yiw  -> _i"
map _  <Plug>(operator-replace)
vmap _  <Plug>(operator-replace)
" }}}

call neobundle#end()

" Required:
filetype plugin indent on
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"end Neobundle }}}

" common {{{1
syntax on

set modeline
set modelines=3

set swapfile
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/tmp

"tabstop系
set tabstop=2
set softtabstop=2
set shiftwidth=2 
set expandtab shiftwidth=2

"アンドゥの永続化
set undofile
set undodir=~/.vim/tmp

colorscheme desert

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
nnoremap [q :UnitePrevious<CR>   " 前へ
nnoremap ]q :UniteNext<CR>       " 次へ
nnoremap [Q :<C-u>UniteFirst<CR> " 最初へ
nnoremap ]Q :<C-u>UniteLast<CR>  " 最後へ
autocmd QuickFixCmdPost *grep* cwindow

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
