" #########################################################################################################
" #                                   Vundle manages IDE plugins                                          #
" #########################################################################################################
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'                  " A Git Wrapper for managing changes inside vim
Plugin 'tpope/vim-rails'                     " A Rails wrapper for easily navigating rails projects
Plugin 'scrooloose/nerdtree'                 " Directory structure for Vim
Plugin 'jistr/vim-nerdtree-tabs'             " NERDTree plugin for easier tab management
Plugin 'scrooloose/syntastic'                " Syntax checking hacks for vim
Plugin 'kien/ctrlp.vim'                      " Fuzzy file search
Plugin 'altercation/vim-colors-solarized'    " Solarized Colorscheme for Vim
Plugin 'bling/vim-airline'                   " Status/tabline for vim to display git branch
Plugin 'vim-airline/vim-airline-themes'      " Enable airline themes
Plugin 'airblade/vim-gitgutter'              " Shows git diff in the sign column(bottom right)
Plugin 'valloric/youcompleteme'              " Code completion
Plugin 'godlygeek/tabular'                   " Automatically fix code alignment
Plugin 'bronson/vim-trailing-whitespace'     " Show trailing whitespace and remove with :FixWhitespace
Plugin 'tyru/open-browser.vim'               " Open web browser from vim
Plugin 'shougo/vimshell.vim'                 " Vim Shell
Plugin 'raimondi/delimitmate'                " Automatically add closing parentheses/brackets/quotes
Plugin 'Yggdroot/indentLine'                 " Display tabs as characters
Plugin 'Shougo/denite.nvim'                  " Unite.vim replacement for VIM interface management
Plugin 'vimwiki'                             " Personal Wiki for VIM
Plugin 'rust-lang/rust.vim'                  " Rust language support

call vundle#end()                            " All of your Plugins must be added before this line

" #########################################################################################################
" #                                    VIM Editor configuration                                           #
" #########################################################################################################
" Set the runtime path to include the bbye plugin for closing buffers
set runtimepath^=~/.vim/bundle/bbye
scriptencoding utf-8
set encoding=utf-8
set nocompatible                             " use vim defaults
syntax on                                    " syntax highlighing
syntax enable                                " syntastic syntax highlighting
filetype on                                  " required
filetype plugin indent on                    " required
set backspace=2                              " make backspace like most other apps
set tabstop=2                                " numbers of spaces of tab character
set shiftwidth=2                             " numbers of spaces to (auto)indent
set scrolloff=5                              " keep 3 lines when scrolling
set showcmd                                  " display incomplete commands
set nohlsearch                               " no highlight searches
set nopaste                                  " no highlight searches
set incsearch                                " do incremental searching
set ruler                                    " show the cursor position all the time
set visualbell t_vb=                         " turn off error beep/flash
set novisualbell                             " turn off visual bell
set nobackup                                 " do not keep a backup file
set number                                   " show line numbers
set ignorecase                               " ignore case when searching
set title                                    " show title in console title bar
set modeline                                 " last lines in document sets vim mode
set modelines=3                              " number lines checked for modelines
set shortmess=atI                            " Abbreviate messages
set nostartofline                            " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]                " move freely between files
set autoindent                               " always set autoindenting on
set smartindent                              " smart indent
set expandtab                                " tabs are converted to spaces, use only when required
set laststatus=2                             " Enable vim-ariline for continuous git info
set noshowmode                               " Turn off default mode display
set t_Co=256                                 " Set the colors to use for VIM
set encoding=utf-8                           " Enable UTF-8 encoding
set guifont=Source\ Code\ Pro\ for\ Powerline\ 12

" #########################################################################################################
" #                                   Color Scheme configuration options                                  #
" #########################################################################################################
" Load airline symbols only if present
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:solarized_termtrans=0                  " Set the transparency of ther terminal to false
let g:solarized_termcolors=256               " Set solarized terminal colors to the standard 256
let g:indentLine_enabled = 0                 " Disable display of tabs by default
let g:airline#extensions#tabline#enabled = 1 " Enable VIM buffer tab display
let g:airline_powerline_fonts = 1            " Enable powerline fonts
let g:bufferline_echo = 0                    " Turn of the default VIM status bar
let g:airline_detect_spell = 1               " Turn on spellcheck
let g:airline_inactive_collapse=1            " Determine whether windows shoudl be collapsed to only filename
let g:airline_symbols.branch = '⎇'           " Set git branch symbol
let g:airline#extensions#bufferline#enabled = 1 " Enable bufferline integration
let g:airline#extensions#syntastic#enabled = 1  " Enable syntastic integration
let g:airline#extensions#promptline#enabled = 0 " Enable promptline integration
let g:airline#extensions#ctrlspace#enabled = 1  "Enable ctrlspace integration
let g:airline#extensions#ycm#enabled = 1        " Enable YouCompleteMe Integration
let g:vimwiki_list = [{ 'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md'}]
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Rust formatter
let g:rustfmt_autosave = 1

set background=dark                          " adapt colors for background
highlight Normal guibg=black guifg=white     " Change the background color to be compatible with Solarized
colorscheme solarized                        " Set color scheme to Solarized
set guicursor=n-v-c:block-Cursor             " Cursor shape (insert => vertical line)
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" #########################################################################################################
" #                                   NERDTree configuration options                                      #
" #########################################################################################################
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:nerdtree_tabs_autoclose=0
let g:nerdtree_tabs_smart_startup_focus=0
let g:nerdtree_tabs_startup_cd=0

" #########################################################################################################
" #                                   Auto-run commands                                                   #
" #########################################################################################################
if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72

    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " Change spaces to dots
    autocmd vimenter * set list lcs=space:·          " Display spaces as dot
    autocmd vimenter * set nolist                    " Turn off whitespace display on enter
endif


" #########################################################################################################
" #                                         Syntastic configuration settings                              #
" #########################################################################################################
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['syntastic-ruby-rubocop']

" #########################################################################################################
" #                                         Key mappings                                                  #
" #########################################################################################################
" Grab the ALT key being sent to the terminal
execute "set <M-1>=\e1"
noremap <F7> :bp!<CR><CR>                            " Previous file in buffer
noremap <F8> :bn!<CR><CR>                            " Next file in buffer
noremap <leader> :bw!<CR><CR>
noremap <Tab> <C-w><C-w><CR><CR>                     " Tab between windows
noremap ¡ :NERDTreeToggle <CR><CR>               " Toggle the NERDTREE display
noremap <F5> :Gstatus <CR><CR>                       " Check the git status
noremap <F6> :FixWhitespace <CR><CR>                 " Remove trailing whitespace
" Rails open controller
nmap <M-c> <Plug>:Econtroller
" Rails open model
nmap <M-m> <Plug>:Emodel
" Rails open view
nmap <M-v> <Plug>:Eview
noremap <F12> :set list! \| IndentLinesToggle<CR><CR>
noremap <F4> :VimwikiIndex<CR><CR>
noremap z :Bdelete <CR>

" #########################################################################################################
" #                                         Unused VIM options                                            #
" #########################################################################################################
"
" Currently unused plugins:
" Plugin 'git://github.com/sheerun/vim-polyglot.git'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" Currently Unused editor options
" set noignorecase                                   " don't ignore case
" set ttyfast                                        " smoother changes
" set ttyscroll=0                                    " turn off scrolling, didn't work well with PuTTY
" set viminfo='20,<50,s10,h
" set mouse=a
" set cindent                                        " cindent
" set noautoindent
" set nosmartindent
" set nocindent
" set autowrite                                      " auto saves changes when quitting and swiching buffer
" set sm                                             " show matching braces, somewhat annoying...
" set nowrap                                         " don't wrap lines
" set guicursor+=i:ver30-iCursor
