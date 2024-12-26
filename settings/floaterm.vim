let g:floaterm_position = 'topright'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_title = 'PEAKKKKKKKKK'
let g:floaterm_titleposition = 'center'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
let g:floaterm_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

" Set color
hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen
hi FloatermNC guibg=darkred

autocmd User FloatermOpen        " triggered after opening a new/existed floater

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to manage terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new terminal
nnoremap <silent> <F9> :FloatermNew zsh<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermNew zsh<CR>

" Toggle terminal
nnoremap <silent> <F10> :FloatermToggle<CR>
tnoremap <silent> <F10> <C-\><C-n>:FloatermToggle<CR>
