syntax on
let mapleader = "\<Space>"
set number

" deleteが効かないことがある対応
set backspace=indent,eol,start

" lightline使う用
" https://itchyny.hatenablog.com/entry/20130828/1377653592
set laststatus=2

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


augroup ymlFile
  autocmd!
  autocmd FileType yml setlocal sw=2 sts=2 ts=2 expandtab smartindent number
augroup END


" インサートのjjをescに割りあてる
inoremap <silent> jj <ESC>

" VimGrep + QuickFix
" https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" パッケージ管理
" vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'dhruvasagar/vim-table-mode', {'on': ['TableModeEnable']}

  " Ansi Escapeキャラクタを理解して色付けてくれる
  " 後発のPluginもある
  " https://github.com/vim-scripts/Improved-AnsiEsc
  Plug 'vim-scripts/AnsiEsc.vim', {'on': ['AnsiEsc']}

  " :OverCommandLine で置換の結果をリアルタイムに表示してくれる
  Plug 'osyo-manga/vim-over', {'on': ['OverCommandLine']}

  " C-pで検索できる
  Plug 'ctrlpvim/ctrlp.vim'
  " ctrlp のmatcher, はやいらしい
  " https://mattn.kaoriya.net/software/vim/20150605164551.htm
  Plug 'nixprime/cpsm'

  " powerline的な
  " https://itchyny.hatenablog.com/entry/20130828/1377653592
  Plug 'itchyny/lightline.vim'

  " Ansibleのシンタックスハイライト
  Plug 'pearofducks/ansible-vim'

  " nginxのシンタックスハイライト
  Plug 'chr4/nginx.vim', {'for': 'nginx'}

call plug#end()

" vim-table-modeで Markdown Compatibleなtableで整形してくれる
let g:table_mode_corner='|'

" CtrlPのmatcherをcpsmにする
" https://github.com/nixprime/cpsm
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" ctrlp smarttabsの設定
let g:ctrlp_extensions = ['smarttabs']


" ansible-vimで、2行以上yamlの空行があるとindentを戻す
let g:ansible_unindent_after_newline = 1





" 使ってないやつ↓
" Rename <filename> でリネームできるようになる
" command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
