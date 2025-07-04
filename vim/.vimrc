" vimrc
" vim: set sw=2 ts=2 sts=2 et tw=80 foldlevel=0 foldmethod=marker :

set nocompatible        " Must be first line

" Plug menu {{{
call plug#begin('~/.vim/plugged')

" basic
Plug 'majutsushi/tagbar'
Plug 'gorodinskiy/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/matchit.zip'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'shougo/denite.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nathanaelkane/vim-indent-guides'

" denops
Plug 'vim-denops/denops.vim'

" ddu
Plug 'Shougo/ddu.vim'
Plug 'Shougo/ddu-ui-filer'
Plug 'Shougo/ddu-ui-ff'
Plug 'Shougo/ddu-source-file'
Plug 'Shougo/ddu-source-file_rec'
Plug 'shun/ddu-source-buffer'
Plug 'Shougo/ddu-source-register'
Plug 'Shougo/ddu-kind-file'
Plug 'Shougo/ddu-kind-word'
Plug 'Shougo/ddu-column-filename'
Plug 'Shougo/ddu-filter-matcher_substring'


" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'

" colorscheme
"Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'
"Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" lint
Plug 'w0rp/ale'

" autocomplete
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" languages
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
"Plug 'stephpy/vim-yaml'
Plug 'smancill/conky-syntax.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'uarun/vim-protobuf'

" php
"Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
"Plug 'kristijanhusak/deoplete-phpactor'
"Plug '2072/php-indenting-for-vim', {'for': 'php'}

" javascript jsx
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

" html css
Plug 'cakebaker/scss-syntax.vim'

" docker
Plug 'ekalinin/Dockerfile.vim'

" ansible
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" python
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

" Terraform
Plug 'hashivim/vim-hashicorp-tools'

" Copilot
Plug 'github/copilot.vim'
Plug 'DanBradbury/copilot-chat.vim'
call plug#end()
" }}}

" General {{{
set background=dark             " Assume a dark background
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set showcmd                     " Show partial commands in status line and
set ruler                       " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set laststatus=2                " 2: always
set updatetime=100

set showmode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set cursorline                  " Highlight the screen line of the cursor with CursorLine
set number                      " Line numbers on
set relativenumber
set showmatch                   " Show matching brackets/parenthesis

" search:
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set history=1000                " Store a ton of history (default is 20)
set hidden                      " Allow buffer switching without saving
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac"

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

filetype plugin indent on        " Automatically detect file types.
syntax on                        " Syntax highlighting

" set tab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType proto setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 expandtab

let mapleader = ',' " Replace leader to ',', default leader is '\'

" Clean searching highlight
nnoremap \ :noh<cr>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>vr :<C-U>source $MYVIMRC<CR>

" }}}

" Color {{{
set termguicolors
if isdirectory(expand("~/.vim/plugged/gruvbox/"))
    colorscheme gruvbox
"if isdirectory(expand("~/.vim/plugged/catppuccin/"))
    "colorscheme catppuccin_macchiato
else
    colorscheme slate
endif
" }}}

" Set FileType {{{
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead *.vue setlocal filetype=vue
autocmd BufNewFile,BufRead .terraformrc setlocal filetype=terraform

au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
" }}}

" Directory of swap, backup and undo {{{
" store swapfiles in a central location
set directory=~/.vim/tmp/swap//
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif

" enable backup
set backup                      " Backups are nice ...
set backupdir=~/.vim/tmp/backup//
if !isdirectory(&backupdir)
    call mkdir(&backupdir, 'p')
endif

" enable persistent undo
if has('persistent_undo')
    set undofile
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=~/.vim/tmp/undo//

    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
endif
" }}}

" Folding {{{
set foldmethod=syntax
set foldlevel=99
"set nofoldenable
set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes .. sub
endfunction
" }}}
" }}}


" # Plugin settings

" ddu {{{
" ddu-filer {{{
nnoremap <silent> <space>e <Cmd>call ddu#start(#{ name: 'files', searchPath: expand('%:p'), })<CR>

call ddu#custom#patch_local('files', #{
    \   ui: 'filer',
    \   sync: v:true,
    \   actionOptions: #{
    \     narrow: #{ quit: v:false },
    \   },
    \   uiParams: #{
    \     filer: #{
    \       winWidth: 40,
    \       split: 'vertical',
    \       splitDirection: 'topleft',
    \       sortTreesFirst: v:true,
    \       sort: 'filename',
    \       previewSplit: 'vertical',
    \     },
    \   },
    \   sources: [#{ name: 'file', params: {} }],
    \   sourceOptions: #{
    \     _: #{
    \       columns: ['filename'],
    \     },
    \   },
    \   kindOptions: #{
    \     file: #{
    \       defaultAction: 'open',
    \     },
    \   },
    \ })

autocmd FileType ddu-filer call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><expr> <CR>
      \ ddu#ui#get_item()->get('isTree', v:false)
      \ ? "<Cmd>call ddu#ui#do_action('expandItem', #{ mode: 'toggle' })<CR>"
      \ : "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open' })<CR>"
  nnoremap <buffer><expr> l
        \   ddu#ui#get_item()->get('isTree', v:false)
        \ ? "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>"
        \ : "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open' })<CR>"
  nnoremap <buffer> h
        \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow', params: #{ path: '..' } })<CR>
  nnoremap <buffer> o
      \ <Cmd>call ddu#ui#do_action('expandItem', #{ mode: 'toggle' })<CR>
  nnoremap <buffer> <Space>
      \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> A
      \ <Cmd>call ddu#ui#do_action('inputAction')<CR>
  nnoremap <buffer> q
      \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer> c
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'copy'})<CR>
  nnoremap <buffer> p
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'paste'})<CR>
  nnoremap <buffer> d
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete'})<CR>
  nnoremap <buffer> r
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename'})<CR>
  nnoremap <buffer> N
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile'})<CR>
  nnoremap <buffer> yy
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'yank'})<CR>
  nnoremap <buffer> P
      \ <Cmd>call ddu#ui#do_action('togglePreview')<CR>
endfunction
" }}}

" ddu-ff {{{
nnoremap <silent> <space>f <Cmd>call ddu#start(#{ name: 'ff' })<CR>
nnoremap <silent> <space>b <Cmd>call ddu#start(#{ name: 'ff', sources: [#{ name: 'buffer' }] })<CR>
nnoremap <silent> <space>r <Cmd>call ddu#start(#{ name: 'register' })<CR>

call ddu#custom#patch_local('ff', #{
    \   ui: 'ff',
    \   sources: [#{ name: 'file_rec', params: {} }],
    \   sourceOptions: #{
    \     _: #{
    \       matchers: ['matcher_substring'],
    \     },
    \   },
    \   kindOptions: #{
    \     file: #{
    \       defaultAction: 'open',
    \     },
    \   },
    \ })

call ddu#custom#patch_local('register', #{
    \   ui: 'ff',
    \   sources: [#{ name: 'register' }],
    \   kindOptions: #{
    \     word: #{
    \       defaultAction: 'append',
    \     },
    \   },
    \ })

autocmd FileType ddu-ff :call s:ddu_ff_my_settings()
function! s:ddu_ff_my_settings() abort
  nnoremap <buffer> <CR>
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'default' })<CR>
  nnoremap <buffer> l
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>"
  nnoremap <buffer> h
      \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow', params: #{ path: '..' } })<CR>
  nnoremap <buffer> <Space>
      \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> <C-r>
      \ <Cmd>call ddu#ui#do_action('redraw')<CR>
  nnoremap <buffer> A
      \ <Cmd>call ddu#ui#do_action('inputAction')<CR>
  nnoremap <buffer> i
      \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer> q
      \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer> a
      \ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
  nnoremap <buffer> c
      \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'cd'})<CR>
  nnoremap <buffer> d
      \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>
  nnoremap <buffer> P
      \ <Cmd>call ddu#ui#do_action('togglePreview')<CR>
endfunction
" }}}
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'cool'
let g:airline_theme = 'gruvbox'
"let g:airline_left_sep='⟩'  " Slightly fancier than '>'
"let g:airline_right_sep='⟨' " Slightly fancier than '<'

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '⟩'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#excludes = [ 'tagbar' ]
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
" }}}

" Neosnippet {{{
" key mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#enable_completed_snippet = 1
"let g:neosnippet#expand_word_boundary = 1
"let g:neosnippet#enable_complete_done = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1

" omni_patterns
"set completeopt+=noinsert,noselect
"call deoplete#custom#option('omni_patterns', {
"\ 'go': '[^. *\t]\.\w*',
"\})

" Tab Select behavior.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
" }}}

" Enable omni completion {{{
" TODO: integration with Deoplete
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}

" Ale {{{
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {
"\   'php': ['phpcs'],
\   'go': ['gopls', 'gofmt', 'go build'],
\   'yaml.ansible': ['ansible-lint'],
\   }
let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'python': ['yapf', 'isort'],
  \ }
let g:ale_php_phpcs_standard = 'PSR1,PSR12'

let g:ale_go_golangci_lint_options = ' '
let g:ale_go_golangci_lint_package = 1

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'

let g:ale_echo_msg_error_str = '✖ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" }}}

" Better Whitespace {{{
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist=['markdown', 'diff', 'gitcommit', 'unite', 'qf', 'help']
" }}}

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
" }}}

" vim-go golang {{{
" highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"

au FileType go nmap <Leader>i <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>R <Plug>(go-rename)
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test-func)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" }}}

" close tag {{{
let g:closetag_filetypes = 'html,jsx,javascript'
" }}}

" Tabularize {{{
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }}}

" TagBar {{{
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
" }}}

" rainbow {{{
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,\|:=\|!=\|==_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" }}}

" Vimux {{{
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
" }}}

" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}

" Markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 2
" }}}

" Denite {{{
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
endfunction

nnoremap <silent> <leader>b :<C-u>Denite buffer<CR>
nnoremap <silent> <leader>/ :<C-u>Denite grep -no-empty<CR>
nnoremap <silent> <leader>f :<C-u>Denite -start-filter file/rec<CR>
nnoremap <silent> <leader>o :<C-u>Denite outline<CR>
nnoremap <silent> <leader>h :<C-u>Denite help<CR>
nnoremap <silent> <leader>r :<C-u>Denite register<CR>
nnoremap <silent> <leader>l :<C-u>Denite line<CR>
nnoremap <silent> <leader>! :<C-u>Denite -resume<CR>
nnoremap <silent> <leader>m :<C-u>Denite menu<CR>

call denite#custom#map('insert', '<C-[>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<C-[>', '<denite:quit>', 'noremap')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
    \ 'description': 'Edit zsh configuration'
    \ }
let s:menus.zsh.file_candidates = [
    \ ['zshrc', '~/.zshrc'],
    \ ]
let s:menus.vim = {
    \ 'description': 'Edit vimrc'
    \ }
let s:menus.vim.file_candidates = [
    \ ['vimrc', '~/.vimrc'],
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#alias('source', 'git', 'file/rec')
call denite#custom#var('git', 'command',
          \ ['git', 's'])
" }}}

" Phpactor {{{
augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
    au FileType php nmap <buffer> <Leader>Oh :PhpactorGotoDefinitionHsplit<CR>
    au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
    au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
    au FileType php nmap <buffer> gd :PhpactorGotoDefinition<CR>
augroup END
" }}}

" Terraform {{{
let g:terraform_fmt_on_save=1
" }}}


" Copilot Chat {{{
" Open a new Cpilot Chat window
nnoremap <space>cc :CopilotChatOpen<CR>

" Add visual selection to copilot window
vmap <space>a <Plug>CopilotChatAddSelection
" }}}
