set nocompatible
filetype off

" Set VIM to source configuration from other directories
set exrc
set secure

" Set the runtime path to include Vundle and intialize
" (REQUIRED) See: https://github.com/VundleVim/Vundle.vim#about
set rtp+=~/.vim/bundle/vundle/
" (REQUIRED) See: https://github.com/VundleVim/Vundle.vim#about
call vundle#begin()

" Let Vundle manage itself
" (REQUIRED) See: https://github.com/VundleVim/Vundle.vim#about
Plugin 'VundleVim/Vundle.vim'

" For use with YCM:
Plugin 'Valloric/YouCompleteMe'

" Core Bundle
Bundle 'gmarik/vundle'

" Your Bundles Here
Bundle 'altercation/vim-colors-solarized'

" (REQUIRED) See: https://github.com/VundleVim/Vundle.vim#about
call vundle#end()
" (REQUIRED) See: https://github.com/VundleVim/Vundle.vim#about
filetype plugin indent on

execute pathogen#infect()

" Vim colour settings
syntax enable
set background=dark " dark | light "
colorscheme solarized
" To toggle the vim colorscheme between dark and light
call togglebg#map("<F5>")

filetype plugin indent on
filetype plugin on

" Set colours for warnings and errors
" Error colours
highlight YcmErrorSign guibg=#FF0000
highlight SyntasticErrorSign guibg=#FF4000
highlight error guibg=#FF8000
" Warning colours
highlight YcmWarningSign guibg=#EB8300
highlight SyntasticWarningSign guibg=#EBAB00
highlight todo guibg=#EBD600

" Recompile for YCM
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>

set tw=80
set ruler
set number
set colorcolumn=80,100
" Add better gutter support
highlight clear SignColumn

" Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Infer indentation and set tab length
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

" Set cursor-line highlighting and relative number locations.
set cursorline
set relativenumber

set fo=croqt
set number
set guifont=Menlo\ Regular:h16

" ctags optimization
set autochdir
set tags=tags;

" Set path variable to open adjacent header files
let &path.="../include/"
" Let YCM read tags from ctags file
let g:ycm_collect_identifiers_from_tags_files = 1

" Get the buffer to always appear in vim
autocmd BufRead,BufNewFile *.{cpp,c} setlocal signcolumn=yes

" Interpret unknown files to view them colourized
augroup filetypedetect
    " associate *.bb with sh filetype
    au BufRead,BufNewFile *.bb setfiletype py
augroup END

" Trim trailing whitespace
autocmd BufWrite * kz|:%s/\s\+$//ge|'z
