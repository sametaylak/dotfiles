call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-haml' " for Haml, SASS, SCSS
Plug 'janko/vim-test' " for Tests
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'evanleck/vim-svelte'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Language tools
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'storyn26383/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-rails'
Plug 'rhysd/vim-crystal'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'

" File Types
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}

" Search
Plug 'unblevable/quick-scope'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

" Misc
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'                       " Snippets
Plug 'tpope/vim-eunuch'                       " Unix commands in VIM
Plug 'tpope/vim-repeat'                       " Vim repeater
Plug 'godlygeek/tabular'                      " Text alignments
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'                     " Git wrapper for VIM
Plug 't9md/vim-choosewin'                     " Vim pane choose
Plug 'scrooloose/nerdtree'                    " Classic NERDTree
Plug 'tpope/vim-scriptease'                   " Plugin for making VIM Plugins
Plug 'tpope/vim-commentary'                   " Comment plugin
Plug 'Raimondi/delimitMate'                   " Auto-close brackets, quotes etc.
Plug 'roxma/vim-tmux-clipboard'               " Access tmux clipboard
Plug 'AndrewRadev/splitjoin.vim'              " One-liner or multi-liner
Plug 'ConradIrwin/vim-bracketed-paste'        " Paste helper
Plug 'tmux-plugins/vim-tmux-focus-events'     " for Tmux
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'} " for Tmux
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

"===================== SETTINGS ======================

set nocompatible
filetype off
filetype plugin indent on

set ttyfast
set shell=/bin/sh

if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set fillchars=vert:\|
set laststatus=2
set encoding=utf-8             " Set default encoding to UTF-8
set autoread                   " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start " Makes backspace key more powerful.
set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set mouse=a                    " Enable mouse mode
set nolist
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.

set noautochdir
set noerrorbells               " No beeps
set number relativenumber      " Relative Numbers
set showcmd                    " Show me what I'm typing
set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
set autowrite                  " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats
set noshowmatch                " Do not show matching brackets by flickering
set noshowmode                 " We show the mode with airline or lightline
set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn             " speed up syntax highlighting
set cursorline
set updatetime=300
set pumheight=10               " Completion window max size
set conceallevel=2             " Concealed text is completely hidden

set shortmess+=c               " Shut off completion messages
set belloff+=ctrlg             " If Vim beeps during completion
set re=1
set lazyredraw

" Hide statusline
" set noshowmode
" set noruler
" set laststatus=0
" set noshowcmd
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline#colorscheme#PaperColor#palette = g:lightline#colorscheme#PaperColor_light#palette
let s:palette = g:lightline#colorscheme#PaperColor#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" increase max memory to show syntax highlighting for large files 
set maxmempattern=20000

" recently opened files, :FzfHistory uses it
set viminfo='1000

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

syntax enable
set termguicolors
set t_Co=256
set background=light
" colorscheme base16-atelier-dune-light
colorscheme github

hi Normal guibg=#f3f3f3
hi NonText guibg=#f3f3f3
hi VertSplit guibg=#f3f3f3
hi LineNr guibg=#f3f3f3

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=2 sw=2 sts=2
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=2 sw=2
  autocmd BufNewFile,BufRead *.md setlocal noet ts=2 sw=2
  autocmd BufNewFile,BufRead *.html setlocal noet ts=2 sw=2
  autocmd BufNewFile,BufRead *.cpp setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hpp setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.js setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.ts setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.tsx setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.php setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.vue setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType crystal setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" Colorize all file from start
" autocmd BufEnter * :syntax sync fromstart

"===================== MAPPINGS ======================

let mapleader = ","

noremap <leader>m :tabnew<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" vim test
nmap <silent> <leader>t :call CocAction('runCommand', 'jest.singleTest')<CR>
nmap <silent> <leader>T :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

let test#project_root = s:find_git_root()
let test#strategy = "neovim"
let test#ruby#rspec#executable = ":tabnew | term bundle exec rspec -f d -c"

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Print full path
map <C-f> :echo expand("%:p")<cr>

" ESLint Auto Fix
map <leader>e :call CocAction('runCommand', 'eslint.executeAutofix')<CR>

" Terminal settings
if has('terminal')
  " Kill job and close terminal window
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>

  " switch to normal mode with esc
  tnoremap <Esc> <C-W>N

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
 
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
  nnoremap <leader>ts :split<cr>:term ++curwin<CR>
  nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>

  tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
  tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>
endif

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Exit on j
imap jj <Esc>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $

" Yank the line
nnoremap Y y$

" Do not show stupid q: window
map q: :q

" Don't move on * I'd use a function for this but Vim clobbers the last search
" when you're in a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" mimic the behavior of /%Vfoobar which searches within the previously
" selected visual selection
" while in search mode, pressing / will do this
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" ==================== FZF ====================
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

command! ProjectFiles execute 'FzfFiles' s:find_git_root()

" search 
nmap <C-p> :FzfHistory<cr>
imap <C-p> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-b> :ProjectFiles<cr>
imap <C-b> <esc>:<C-u>ProjectFiles<cr>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" ==================== ag ====================
let g:ackprg = 'ag --vimgrep --smart-case'                                                   

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" ==================== vim-javascript ====================
let g:javascript_plugin_flow = 1

" ==================== Completion + Snippet ====================
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"  
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

" ==================== Various other plugin settings ====================
nmap  -  <Plug>(choosewin)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
