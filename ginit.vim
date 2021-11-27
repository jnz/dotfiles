" Default location
" Windows: %LOCALAPPDATA%\nvim\ginit.vim
" MacOS: ~/.config/nvim/ginit.vim
" Linux: ~/.config/nvim/ginit.vim

" Detect environment
" (from https://github.com/justinmk/config/blob/master/.vimrc)
" Global g: so that we can use it e.g. in .vimrc.local
let g:is_msys = ($MSYSTEM =~? 'MINGW\d\d')
let g:is_msysgit = (has('win32') || has('win64')) && $TERM ==? 'cygwin'
let g:is_gui = has('gui_running') || strlen(&term) == 0 || &term ==? 'builtin_gui'
let g:is_windows = has('win32') || has('win64') || g:is_msys || g:is_msysgit

if g:is_windows
    set runtimepath^=~/vimfiles runtimepath+=~/vimfiles/after
    let &packpath = &runtimepath
    source ~/vimfiles/vimrc
else
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
end

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
