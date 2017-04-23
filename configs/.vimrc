""" Colors
colorscheme molokai
syntax enable           " enable syntax processing

""" Spaces & Tabs
set tabstop=4       	" number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab       	" tabs are spaces

""" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

""" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" Movement
nnoremap j gj           " move vertically by visual line
nnoremap k gk
inoremap jk <esc>
inoremap <esc> <nop>
