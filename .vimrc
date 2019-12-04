let mapleader=";" " hotkey prefix: <leader>
filetype on
filetype plugin on

syntax enable " enable syntax highlight
syntax on " enable syntax for specific texts

set laststatus=2 " status line
set ruler " current cursor position
set cursorline " highlight current line
set cursorcolumn " highlight current column
set hlsearch " highlight search result
set nowrap 
" set paste " can paste thing without format problems


"automaticly run .vimrc
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set gcr=a:block-blinkon0 " ban cursor blink

nmap <Leader>q :q<CR> " hotkey to quit current splited window
nmap <leader>w :w<CR> " hotkey to save the content of current window

set incsearch
set ignorecase
set wildmenu

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'davidhalter/jedi-vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Color Scheme
set t_Co=256
set background=dark
"set background=light
"colorscheme solarized
"colorscheme molokai
"colorscheme monokai
"colorscheme phd
colorscheme dracula " colorscheme dracula must be after vundle#end(), as it's installed by vundle



" basic 
set number " line number


" long code more than 80 letters
"augroup vimrc_autocmds
"    autocmd!
"    " highlight characters past column 80
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%80v.*/
"    autocmd FileType python set nowrap
"    augroup END

""""""""""""""""""""""
    "Quickly Run
""""""""""""""""""""""
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python2.7 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

" python
filetype indent on
set expandtab " change tab to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
let g:pymode_python='python3'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

"Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"code fold
set foldmethod=indent  " fold by indent for python
"set foldmethod=syntax " fold by syntax for c/cpp
set nofoldenable " turn fold off when run vim

" NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" jedi
let g:jedi#completions_command = "<C-N>"

