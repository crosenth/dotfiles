" Pathogen
call pathogen#infect()

" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8

" History and undolevels
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Wild settings
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.git,*.pyc,*.class,.svn,vendor/gems/*,_trial_temp,_build

" Alerts
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Python completion
autocmd   FileType  python :set omnifunc=pythoncomplete#Complete

autocmd   FileType  python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=0

" Tab completion
let g:SuperTabDefaultCompletionType = "context"

" Search
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Whitespace
set autoindent
set copyindent
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

syntax enable
filetype plugin on
filetype indent on

" Disable autocommenting 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" F2 paste mode
set pastetoggle=<F2>
set showmode

" Backup and swap files
set nobackup
set noswapfile

"" Filetypes
" SConstruct
au BufNewFile,BufRead SCons* set filetype=scons

" Make
au FileType make setlocal noexpandtab " use real tabs, not tabs expanded to spaces

" Python
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 " follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )

" JSON
au BufNewFile,BufRead *.json set ft=javascript " Treat JSON files like JavaScript

" Make sure all mardown files have the correct filetype set
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

" Color
color delek
