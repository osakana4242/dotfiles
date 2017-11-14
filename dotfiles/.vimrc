" osakana4242 -----------------------------------
" echo "start osakana4242"

" ショートカットキーの一覧
" http://blog.ruedap.com/2011/01/11/vim-keyboard-shortcut-key

let isOsTypeWin = has('win32')
if isOsTypeWin
	set runtimepath^=$HOME/.vim
	set runtimepath+=$HOME/.vim/after
	set encoding=cp932
	" set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8,cp932
	set fileencodings=ucs-bom,euc-jp,iso-2022-jp,utf-8,utf-16,utf-16le,cp932
else
	set encoding=utf-8
	" set fileencodings=iso-2022-jp,sjis,euc-jp,cp932,utf-8
	set fileencodings=ucs-bom,euc-jp,iso-2022-jp,cp932,utf-8,utf-16,utf-16le
endif
set ff=unix
" from http://vimblog.hatenablog.com/entry/vimrc_set_recommended_options
" 画面表示の設定

set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set nowrap         " 折り返さない

" tab
" from http://peacepipe.toshiville.com/2006/05/vimrc-vim.html
" タブを表示するときの幅
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
" 
set softtabstop=0

" 自動インデント.
set autoindent

" 空白文字を可視化
" from: http://blog.remora.cx/2011/08/display-invisible-characters-on-vim.html
" and: http://objectmix.com/editors/762830-vim-6-3-listchars.html
set list
set listchars=tab:=>
set listchars+=trail:.
set listchars+=eol:$
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=nbsp:%
" spaces
    
" tabs

" クリップボード. from http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard+=unnamed
" un~ ファイルの出力先を指定する.
" from: http://www.kaoriya.net/blog/2014/03/30/
set undodir=~/tmp/vim/undo

" ショートカット登録.
"
" 誰がショートカットキーを割り当てているかを確認する方法
" form: http://blog.ruedap.com/2011/01/11/vim-keyboard-shortcut-key
" verbose map
" verbose nmap
"
map <C-S-L> zL
map <C-S-H> zH
" タブ切り替え.
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" キャメル.
map <Leader>c <Plug>(operator-camelize)
map <Leader>C <Plug>(operator-decamelize)

" 大文字小文字の区別.
" set noignorecase
set noic

" 保存時にディレクトリを掘る.
" from http://vim-users.jp/2011/02/hack202/
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}


" colorscheme を lucius にする.
" 最初にdesertを指定しているのはそうしないとなぜかluciusが正し反映されないため.
if isOsTypeWin
	colorscheme desert
	colorscheme lucius
else
	colorscheme desert
	colorscheme lucius
endif

"echo "end osakana4242"
"-------------------------------------------------


"------------------------------------------------
if isOsTypeWin
	" Win
	
	" source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
else
	" Mac
	
	" An example for a vimrc file.
	"
	" Maintainer:	Bram Moolenaar <Bram@vim.org>
	" Last change:	2008 Dec 17
	"
	" To use it, copy it to
	"     for Unix and OS/2:  ~/.vimrc
	"	      for Amiga:  s:.vimrc
	"  for MS-DOS and Win32:  $VIM\_vimrc
	"	    for OpenVMS:  sys$login:.vimrc

	" When started as "evim", evim.vim will already have done these settings.
	if v:progname =~? "evim"
		finish
	endif

	" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

"	if has("vms")
"		set nobackup		" do not keep a backup file, use versions instead
"	else
"		set backup		" keep a backup file
"	endif
	set history=50		" keep 50 lines of command line history
	set ruler		" show the cursor position all the time
	set showcmd		" display incomplete commands
	set incsearch		" do incremental searching

	" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
	" let &guioptions = substitute(&guioptions, "t", "", "g")

	" Don't use Ex mode, use Q for formatting
	map Q gq

	" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
	" so that you can undo CTRL-U after inserting a line break.
	inoremap <C-U> <C-G>u<C-U>

	" In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
		set mouse=a
	endif

	" Switch syntax highlighting on, when the terminal has colors
	" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
		syntax on
		set hlsearch
	endif

	" Only do this part when compiled with support for autocommands.
	if has("autocmd")

		" Enable file type detection.
		" Use the default filetype settings, so that mail gets 'tw' set to 72,
		" 'cindent' is on in C files, etc.
		" Also load indent files, to automatically do language-dependent indenting.
		filetype plugin indent on

		" Put these in an autocmd group, so that we can delete them easily.
		augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		" autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

		augroup END

	else

		set autoindent		" always set autoindenting on

	endif " has("autocmd")

	" Convenient command to see the difference between the current buffer and the
	" file it was loaded from, thus the changes you made.
	" Only define it when not defined already.
	if !exists(":DiffOrig")
		command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
	endif
endif

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする.
" moved .gvimrc
" set iminsert=0
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のバッファがあっても、他のバッファに切り替えられるように.
set hidden
" コマンドライン補完の候補を表示.
set wildmenu
" 勝手に改行すんな！！
set textwidth=0
" statusline のフォーマット指定.
" from http://sourceforge.jp/magazine/07/11/06/0151231
" from http://memo.officebrook.net/20050512.html
set statusline=\ %F%m%r%h%w\ [%{&fenc}\+B%{&bomb},%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

if isOsTypeWin
	" Ctrl+Vの挙動を変更
	nmap <C-v> <C-v>
	cmap <C-v> <C-v>
endif

" Rename コマンド. カレントバッファのファイル名を変更する.
" from: http://d.hatena.ne.jp/fuenor/20100115/1263551230
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

" " カレントウィンドウを新規タブで開き直す.
" " from: http://d.hatena.ne.jp/m1204080/20101025/1288028786
" " コレ使うと vimgrep の quickfix でジャンプできなくなる...
" if v:version >= 700
" 	nnoremap <C-m> :call OpenNewTab()<CR>
" 	function! OpenNewTab()
" 		let f = expand("%:p")
" 		execute ":q"
" 		execute ":tabnew ".f
" 	endfunction
" endif

"-------------------------------------------------------------------------------
" NeoBundle 
" from http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb
" echo "start NeoBundle"
filetype off


set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'

" http://qiita.com/kazu0620/items/d7da3047daed04fc5eba
NeoBundle 'tsukkee/unite-tag.git'

" http://syotaro.ruhoh.com/posts/20121216-tips-vim-outliner/
NeoBundle 'Shougo/unite-outline'
nnoremap <silent> <Space>uo :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR> - See more at: http://syotaro.ruhoh.com/posts/20121216-tips-vim-outliner/#sthash.pikCL09L.dpuf
" nnoremap <silent> <Leader>o :<C-u>Unite -vertical -no-quit outline<CR>


NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

NeoBundle 'tanabe/ToggleCase-vim' " スネーク, キャメル
NeoBundle 'kana/vim-operator-user'
NeoBundle 'tyru/operator-camelize.vim' " スネーク, キャメル

NeoBundle 'troydm/easybuffer.vim' " EasyBuffer コマンド.
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'scrooloose/nerdtree' " サイドペイン.
nnoremap <unique><silent>tt :NERDTreeToggle<CR>
"隠しファイルをデフォルトで表示.
let NERDTreeShowHidden = 1

NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\   }
\ }

NeoBundle 'Shougo/neocomplete.vim'
" neocomplete の設定.
" 起動時に有効化.
let g:neocomplete#enable_at_startup = 1

" NeoBundleLazy 'nosami/Omnisharp', {
" \   'autoload': {'filetypes': ['cs']},
" \   'build': {
" \     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
" \     'mac': 'xbuild server/OmniSharp.sln',
" \     'unix': 'xbuild server/OmniSharp.sln',
" \   }
" \ }

filetype plugin indent on     " required!
filetype indent on
syntax on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

call neobundle#end()

"echo "end NeoBundle"
"
