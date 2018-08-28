set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

syntax on
let mapleader = "\<Space>"
set number
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set completeopt+=preview


" 不可視文字を表示
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

set ignorecase

" insertでもbackspaceを使えるように
set backspace=indent,eol,start

" lightline使う用
" https://itchyny.hatenablog.com/entry/20130828/1377653592
set laststatus=2

silent !mkdir -p ~/.vim/undo
set undodir=~/.vim/undo
set undofile

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
  autocmd FileType yaml setlocal sw=2 sts=2 ts=2 expandtab smartindent number
augroup END


fun! StripTrailingWhiteSpace()
  " markdown以外のファイルの末尾のスペースを取り除く
  if &filetype =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
augroup stripSpace
  autocmd!
  autocmd bufwritepre * :call StripTrailingWhiteSpace()
augroup END

fun! RubocopFix()
  " .rubocop.ymlがあればfixする
  if !empty(glob($PWD . '/.rubocop.yml')) && executable('rubocop')
    !rubocop --config .rubocop.yml --auto-correct %
  endif
endfun
nnoremap <Leader>r :call RubocopFix()<CR>


" VimGrep + QuickFix
" https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" ctagsのジャンプで複数候補がある場合は一覧表示
nnoremap <C-]> g<C-]>

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

  " powerline的な
  " https://itchyny.hatenablog.com/entry/20130828/1377653592
  Plug 'itchyny/lightline.vim'

  " Ansibleのシンタックスハイライト
  Plug 'pearofducks/ansible-vim'

  " nginxのシンタックスハイライト
  Plug 'chr4/nginx.vim', {'for': 'nginx'}

  " async lint と fix
  Plug 'w0rp/ale'

  " Recover
  Plug 'chrisbra/Recover.vim'

  " indentに縦線
  Plug 'Yggdroot/indentLine', {'on': ['IndentLinesToggle']}

  " ColorSchema
  Plug 'junegunn/seoul256.vim'

  " Twitter
  Plug 'twitvim/twitvim', {'on': ['PosttoTwitter', 'FriendsTwitter', 'UserTwitter', 'MentionsTwitter', 'PublicTwitter', 'DMTwitter', 'SearchTwitter']}


  if has('nvim')
    " Plug 'prabirshrestha/async.vim'
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'


  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

call plug#end()

" vim-table-modeで Markdown Compatibleなtableで整形してくれる
let g:table_mode_corner='|'

" CtrlPのmatcherをcpsmにする
" https://github.com/nixprime/cpsm
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" ctrlp smarttabsの設定
let g:ctrlp_extensions = ['smarttabs']

" ansible-vimで、2行以上yamlの空行があるとindentを戻す
let g:ansible_unindent_after_newline = 1
let g:seoul256_background = 233

augroup MyStartup
  autocmd!
  autocmd VimEnter * RecoverPluginEnable
  autocmd VimEnter * colo seoul256
augroup END

" lightline
" show relative filepath
" https://github.com/itchyny/lightline.vim/issues/87
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
    \ }

" twitvim
let twitvim_count = 200

" ale + rubocop
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
