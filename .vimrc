runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.

if has("nvim")
    set shell=/bin/bash
    let g:python_host_prog='/usr/bin/python'
endif

if has(!"nvim")
    set nocompatible
    set ttyfast
    set ttyscroll=3
    set t_Co=256
    if &term =~ '256color'
        set t_ut=
    endif
endif


"Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " Favor verificar o diretorio do Vundle
call vundle#rc()

"Vim swap and backup dir
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

"let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'mileszs/ack.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/CSApprox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuhdev/SingleCompile'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'sheerun/vim-polyglot'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

syntax on

" Enable Regex Engine
set regexpengine=1
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

colorscheme Tomorrow-Night
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set encoding=utf-8
set guifont=Inconsolata-dz\ for\ Powerline\ 11
set number
set ai
set textwidth=0
set wrapmargin=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set synmaxcol=128
set smartindent
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set splitbelow
set splitright
set lazyredraw
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set list
set listchars=tab:»-,eol:¶,extends:›,precedes:‹,nbsp:·,trail:·

" Vim 256 colors
let g:CSApprox_loaded = 1

if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
        set term=xterm-256color
    endif
endif


" Copy then paste multiple times
xnoremap p pgvy

" Tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" Navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch        " Highlight search
set et
set cul             " Cursor line highlight
set cuc             " Cursor column highlight

"set autowrite      " Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)

"OmniComplete
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete

"Default Identation
au FileType html,xhtml,xml,htmldjango,jinjahtml,css,javascript setl sw=2 sts=2 et

augroup vimrc_autocmds
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4 smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    "autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
    "autocmd FileType c nnoremap <buffer> <F9> :exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    "autocmd FileType cpp nnoremap <buffer> <F9> :exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>'
augroup END


"Airline Setup
let g:airline_theme = 'cobalt2'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#show_buffers = 0
let g:javascript_enable_domhtmlcss = 1

"Ack config
map <leader>a :Ack

"Crtlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0

"Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"Gundo config
map <F5> :GundoToggle<CR>

"Vim javascript and javascript libs
let g:used_javascript_libs = 'angularjs,angularui,jquery'
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

"Jedi Vim
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

"Polyglot config
let g:polyglot_disabled = ['javascript']

"Promptline config
let g:promptline_theme = 'airline'
let g:promptline_preset = {
    \'a': [ promptline#slices#python_virtualenv() ],
    \'b': [ promptline#slices#user() ],
    \'c': [ '\h' ],
    \'x': [ promptline#slices#cwd() ],
    \'y': [ promptline#slices#vcs_branch() ],
    \'warn': [ promptline#slices#git_status() ]}

"Indent guide config
au VimEnter * :IndentGuidesEnable
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=gray
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgray


"NerdTree config
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"Single Compile
nmap <F9> :SCCompile<CR>
nmap <F10> :SCCompileRun<CR>

"Syntastic setup
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=zend -n --report=csv"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"Tagbar config
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 "autofocus on Tagbar open

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
