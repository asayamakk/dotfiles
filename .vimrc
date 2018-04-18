" Rename <filename> でリネームできるようになる
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" deleteが効かないことがある対応
set backspace=indent,eol,start

syntax on


" augroup https://qiita.com/s_of_p/items/b61e4c3a0c7ee279848a
" autocmd 指定したイベントが起きたときに自動的に実行するコマンドを指定する
" sw=shiftwidth vimが挿入するインデント
" sts=softtabstop <Tab>キーを押したときに挿入される空白の量
" ts=tabstop ファイルの中の<Tab>文字を表示する幅の大きさ
" et=expandtab <Tab>の代わりにspaceを使う
augroup rubyFile
  autocmd!
  autocmd FileType ruby setlocal sw=2 sts=2 ts=2 expandtab smartindent number
augroup END

" インサートのjjをescに割りあてる
inoremap <silent> jj <ESC>

" パッケージ管理
" vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'dhruvasagar/vim-table-mode', {'on': ['TableModeEnable']}

  " Ansi Escapeキャラクタを理解して色付けてくれる
  " 後発のPluginもある
  " https://github.com/vim-scripts/Improved-AnsiEsc
  Plug 'vim-scripts/AnsiEsc.vim', {'on': ['AnsiEsc']}
call plug#end()

" vim-table-modeで Markdown Compatibleなtableで整形してくれる
let g:table_mode_corner='|'

