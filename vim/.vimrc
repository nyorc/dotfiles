" vimrc
" vim: set sw=2 ts=2 sts=2 et tw=80 foldlevel=0 foldmethod=marker :

set nocompatible " use Vim settings, rather than Vi settings. must be first

" ## Plugin {{{
call plug#begin('~/.vim/plugged')

" basic
Plug 'majutsushi/tagbar'
Plug 'gorodinskiy/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
" Plug 'vim-scripts/matchit.zip'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'tpope/vim-vinegar'

Plug 'girishji/vimcomplete'
Plug 'yegappan/lsp'

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

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
Plug 'tmux-plugins/vim-tmux-focus-events'

" colorscheme
"Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'

" lint
Plug 'w0rp/ale'

" autocomplete
" Plug 'honza/vim-snippets'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" languages
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
"Plug 'stephpy/vim-yaml'
Plug 'uarun/vim-protobuf'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" html css
Plug 'cakebaker/scss-syntax.vim'

" docker
Plug 'ekalinin/Dockerfile.vim'

" Copilot
Plug 'github/copilot.vim'
Plug 'DanBradbury/copilot-chat.vim'
call plug#end()
" }}}

" ## Basic {{{
" display
set number                                     " display line number
set relativenumber                             " disply relative line number
set nowrap                                     " no display longer line on next line
set display=truncate                           " Show @@@ in the last line if it is truncated
set list                                       " Show whitespace characters
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" status line
set showcmd                     " display incomplete commands
set ruler                       " display the cursor position all the time
set laststatus=2                " 2: always display status line
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids

" cursor, moving
set showmode                  " Show the current mode in the status line
set cursorline                " Highlight the screen line of the cursor with CursorLine
set scrolloff=5               " Show a few lines of context around the cursor.
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
set showmatch                 " Show matching brackets/parenthesis

" search
set incsearch  " do incremental searching when it's possible to timeout.
set hlsearch   " highlight search terms
set ignorecase " case insensitive search
set smartcase  " case sensitive when search upper case characters

" command
set history=1000                " Store a ton of history (default is 20)
set wildmenu                    " Menu completion in command mode on <Tab>
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

set hidden                      " Allow buffer switching without saving
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" typing
set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

" fileformat
set fileformat=unix " Use Unix file format by default
set fileformats=unix,dos,mac " Try Unix, then DOS, then Mac

set nrformats-=octal " Don't recognize octal numbers for Ctrl-A and Ctrl-X

" Don't use Q for Ex mode, use it for formatting.  Except for Select mode.
" Revert with ":unmap Q".
map Q gq
sunmap Q

" mouse
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | exe 'au!' | augroup END"
augroup vimStartup
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

filetype plugin indent on        " Automatically detect file types.
syntax on                        " Enable syntax highlighting

" indent
set autoindent                  " Indent at the same level of the previous line
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

" folding
set foldmethod=syntax
set foldlevel=99
" set nofoldenable
set foldtext=MyFoldText()
function! MyFoldText()
  let prefix = '+'
  let dash = repeat('>', v:foldlevel)
  let line = getline(v:foldstart)
  let nl = v:foldend - v:foldstart + 1
  return prefix . dash . line . ' <<< ' . nl . ' |'
endfunction

" indent for specific filetype
autocmd FileType vim setlocal ts=2 sts=2 sw=2 et
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et
autocmd FileType html setlocal ts=2 sts=2 sw=2 et
autocmd FileType json setlocal ts=2 sts=2 sw=2 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et
autocmd FileType vue setlocal ts=2 sts=2 sw=2 et
autocmd FileType proto setlocal ts=2 sts=2 sw=2 et

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" color
set background=dark             " Assume a dark background
set termguicolors
if isdirectory(expand("~/.vim/plugged/gruvbox/"))
  colorscheme gruvbox
else
  colorscheme desert
endif

" }}}

" ## mappings {{{
let mapleader = ',' " Replace leader to ',', default leader is '\'

" Clean searching highlight
nnoremap \ :noh<cr>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>vr :<C-U>source $MYVIMRC<CR>
" }}}

" ## Set FileType {{{
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

" ## swap, backup and undo {{{
" store swapfiles in a central location
set updatetime=100
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

" # Plugin settings

" ## fzf {{{
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6, 'yoffset': 1.0 } }

nnoremap <silent> <Leader>b <Cmd>Buffers<CR>
nnoremap <silent> <Leader>f <Cmd>Files<CR>
nnoremap <silent> <Leader>g <Cmd>GFiles?<CR>
nnoremap <silent> <Leader>/ <Cmd>RG<CR>
" }}}

" ## netrw {{{
let g:netrw_liststyle = 3
nnoremap <silent> <space>e <Cmd>Explore<CR>

autocmd FileType netrw nnoremap <silent> qq <C-^>
" }}}

" ## Airline {{{
let g:airline_powerline_fonts = 1
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

" ## vimcomplete {{{
let customOptions = #{
      \ completor: #{ shuffleEqualPriority: v:true, postfixHighlight: v:true  },
      \ buffer: #{ priority: 10 },
      \}
autocmd VimEnter * call g:VimCompleteOptionsSet(customOptions)
" }}}

" ## LSP {{{
autocmd User LspSetup call lsp#options#OptionsSet(#{
  \   aleSupport: v:true,
  \   completionMatcher: 'icase',
  \ })

if (executable('pylsp'))
  autocmd User LspSetup call lsp#lsp#AddServer([#{
        \   name: 'pylsp',
        \   filetype: ['python'],
        \   path: 'pylsp',
        \ }])
endif

if (executable('gopls'))
  autocmd User LspSetup call lsp#lsp#AddServer([#{
        \   name: 'gopls',
        \   filetype: ['go', 'gomod', 'gohtmltmpl', 'gotexttmpl'],
        \   path: 'gopls',
        \   args: ['-remote=auto']
        \ }])
endif

if executable('vim-language-server')
  autocmd User LspSetup call lsp#lsp#AddServer([#{name: 'vimls',
   \   filetype: ['vim'],
   \   path: 'vim-language-server',
   \   args: ['--stdio'],
   \   initialization_options: #{
   \     vimruntime: $VIMRUNTIME,
   \     runtimepath: &rtp,
   \   }
   \ }])
endif

autocmd User LspAttached call s:on_lsp_enabled()
function! s:on_lsp_enabled() abort
  if exists('+tagfunc') | setlocal tagfunc=lsp#lsp#TagFunc | endif

  nnoremap <buffer> gd <Cmd>LspGotoDefinition<CR>
  nnoremap <buffer> gi <Cmd>LspPeekImpl<CR>
  nnoremap <buffer> gt <Cmd>LspGotoTypeDef<CR>
  nnoremap <buffer> gr <Cmd>LspPeekReferences<CR>
  nnoremap <buffer> gD <Cmd>LspGotoDeclaration<CR>
  nnoremap <buffer> gs <Cmd>LspDocumentSymbol<CR>
  nnoremap <buffer> K <Cmd>LspHover<CR>
  nnoremap <buffer> <leader>rn <Cmd>LspRename<CR>
  nnoremap <buffer> <leader>o <Cmd>vert belowright 50LspOutline<CR>
endfunction

" }}}

" ## Neosnippet {{{
" key mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#enable_completed_snippet = 1
"let g:neosnippet#expand_word_boundary = 1
"let g:neosnippet#enable_complete_done = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
" }}}

" Tab Select behavior.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" close preview window
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Ale {{{
let g:ale_lint_on_text_changed = 'never'
" let g:ale_go_gopls_options = '-remote=auto' " Use gopls with remote mode
let g:ale_linters = {
\   'go': ['gofmt', 'go build'],
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
let g:go_code_completion_enabled = 0 " Use lsp completion
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

" Copilot Chat {{{
" Open a new Cpilot Chat window
nnoremap <space>cc :CopilotChatOpen<CR>

" Add visual selection to copilot window
vmap <space>a <Plug>CopilotChatAddSelection
" }}}

" enable autoread files changed on disk
set autoread

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
