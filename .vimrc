" Put swapfiles in a central place
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" Color scheme: https://github.com/altercation/solarized
syntax enable
set background=dark
colorscheme solarized

" Allow hidden buffers to have unsaved changes
set hidden

" Statusline
set laststatus=2

" Hide toolbar and scrollbar
set guioptions-=T
set guioptions-=r

" Fix tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if has('gui_running')
    " Guifont pulled from: https://github.com/Lokaltog/powerline-fonts
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10

    " Powerline see: https://github.com/Lokaltog/powerline
    set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
endif

" Have tab call ctrl+P when not a beginning of a line or on a word in insert mode
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>