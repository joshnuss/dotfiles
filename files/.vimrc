execute pathogen#infect()
set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

set runtimepath+=~/.vim/UltiSnips-2.2 " Add UltiSnips to runtime path

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ai
set expandtab
set smarttab
set hlsearch
set hidden
set nowrap
set wildignore+=tmp
set wildignore+=public/assets
set background=dark
colorscheme solarized
let g:ackprg="ack -H --nocolor --nogroup --column"

let mapleader=","

set nobackup

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType js,html,ruby,eruby,yaml,haml,coffee set ai sw=2 sts=2 et
  autocmd FileType python set tabstop=4
  autocmd FileType * call UltiSnips_FileTypeChanged()

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

augroup filetypedetect
	  au! BufRead,BufNewFile *.thor		setfiletype ruby
	  au! BufRead,BufNewFile Gemfile	setfiletype ruby
	  au! BufRead,BufNewFile Rakefile setfiletype ruby
	  au! BufRead,BufNewFile Gaurdile setfiletype ruby
augroup END

:map <C-c> "+y<CR>
:map <C-v> "+p<CR>

"
:imap <C-S-l> <space>=><space>
" for help with ruby/js hashes
:imap <C-l> :<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"
" Shortcut to rapidly toggle `set list`
nmap <silent> <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
