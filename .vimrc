set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

syntax enable
filetype plugin indent on

" let mapleader = "\<Space>"
set number
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set completeopt+=preview

set hidden
set confirm
set autoread

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

augroup tsvFile
  autocmd!
  autocmd FileType tsv setlocal sw=10 sts=10 ts=10 noexpandtab smartindent number
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
augroup markdownPresentation
  autocmd!
  au FileType markdown let b:presenting_slide_separator = '---'
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

" tabの移動
nnoremap <Leader>] :tabnext<CR>
nnoremap <Leader>[ :tabprevious<CR>


let g:ale_completion_enabled = 1


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

  " fzf
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

  " Git連携
  Plug 'tpope/vim-fugitive'

  Plug 'thinca/vim-ref'
  Plug 'yuku/vim-ref-ri', {'for': 'ruby'}


  " powerline的な
  " https://itchyny.hatenablog.com/entry/20130828/1377653592
  Plug 'itchyny/lightline.vim'

  " シンタックスハイライト ansible/terraform/jinja2
  Plug 'pearofducks/ansible-vim'
  Plug 'hashivim/vim-terraform'
  Plug 'Glench/Vim-Jinja2-Syntax'

  " nginxのシンタックスハイライト
  Plug 'chr4/nginx.vim', {'for': 'nginx'}

  " async lint と fix
  Plug 'w0rp/ale'

  Plug 'elmcast/elm-vim', { 'for': 'elm' }

  " indentに縦線
  Plug 'Yggdroot/indentLine', {'on': ['IndentLinesToggle']}
  " アウトライン
  Plug 'majutsushi/tagbar', {'on': ['TagbarToggle']}

  " ColorSchema
  Plug 'junegunn/seoul256.vim'

  " Twitter
  Plug 'twitvim/twitvim', {'on': ['PosttoTwitter', 'FriendsTwitter', 'UserTwitter', 'MentionsTwitter', 'PublicTwitter', 'DMTwitter', 'SearchTwitter']}

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

  " Rubyでif/def<->endにjumpできる
  Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}

  Plug 'vim-scripts/SQLUtilities'
  Plug 'vim-scripts/Align'
  Plug 'mechatroner/rainbow_csv'
  Plug 'sotte/presenting.vim', {'on': ['PresentingStart']}

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" vim-table-modeで Markdown Compatibleなtableで整形してくれる
let g:table_mode_corner='|'

" ansible-vimで、2行以上yamlの空行があるとindentを戻す
let g:ansible_unindent_after_newline = 1
let g:seoul256_background = 233

let g:indentLine_char = '▏'

augroup MyStartup
  autocmd!
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

" =========
" ale
" =========
let g:ale_fixers = {
\   'elm': ['elm-format'],
\   'ruby': ['rubocop'],
\}

let g:ale_linters = {
\   'elm': ['elm_ls']
\}


" =========
" elm
" =========
" https://github.com/elm-tooling/elm-vim
"
" language server

" https://shapeshed.com/vim-netrw/
" netrwを使いやすく
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10

" https://qiita.com/izumin5210/items/d2e352de1e541ff97079
" <C-w> 系を Vim Tmux Navigator に移譲する
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\\ :TmuxNavigatePrevious<cr>


" rust
let g:rustfmt_autosave = 1


" coc.vim
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>r  :<C-u>CocListResume<CR>

" cocおしまい


" space + p でfzfのファイル検索
nnoremap <space>p :GFiles<CR>

" space + o でfzfのファイル検索(git以外も)
nnoremap <space>o :Files<CR>


" fzf + git grep:  https://github.com/junegunn/fzf.vim#example-git-grep-wrapper
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

