" カラー設定:
"colorscheme darkblue
colorscheme desert
colorscheme lucius

set guioptions+=b "水平スクロールバーの表示.

" IMEがうざいでござる
" from: http://d.hatena.ne.jp/pneumaster/20080812/1218498357
set iminsert=0
set imsearch=-1

" IMEオンオフ時のカーソルの色指定.
if has('multi_byte_ime')
  "highlight Cursor   guifg=NONE guibg=#00a000
  "highlight CursorIM guifg=NONE guibg=#ff00ff " 効かない...
endif
" echo "loaded gvimrc"

