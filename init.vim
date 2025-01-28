set mouse=a
set expandtab
set tabstop=4
set shiftwidth=4
set listchars=tab:\¦\
set list
set foldmethod=syntax         
set foldnestmax=1
set foldlevelstart=3
set number
set ignorecase
set nobackup
set nowb
set noswapfile
set synmaxcol=3000
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent

syntax on

set clipboard=unnamedplus

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

call plug#begin(stdpath('config').'/plugged')
" Theme
  Plug 'folke/tokyonight.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" File browser
  Plug 'preservim/nerdTree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'unkiwii/vim-nerdtree-sync'
  Plug 'jcharum/vim-nerdtree-syntax-highlight',
    \ {'branch': 'escape-keys'}

  if has('nvim')
    function! UpdateRemotePlugins(...)
      let &rtp=&rtp
      UpdateRemotePlugins
    endfunction
    Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
  else
    Plug 'gelguy/wilder.nvim'
  endif

" File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'

" Code intellisense
  Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter'

" Code syntax highlight
  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  Plug 'sheerun/vim-polyglot'                   " Other language
  Plug 'yuezk/vim-js'                           " Javascript
  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX
  
" Debugging
  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge

" Fold 
  Plug 'tmhedberg/SimpylFold'

" Github Copilot
  Plug 'github/copilot.vim'
call plug#end()

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Down>',
      \ 'previous_key': '<Up>',
      \ 'accept_key': '<Tab>',
      \ 'reject_key': '<S-Tab>',
      \ })
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'pumblend': 20, 
      \ }))

" Set theme
colorscheme tokyonight-moon
let g:airline_theme='base16'

set termguicolors
autocmd VimEnter * call s:setup_lualine()
function! s:setup_lualine() abort
lua<<EOF
require("bufferline").setup{
  options = {
    indicator = {
      style = 'none',
    },
    diagnostics = "coc",
  }
}
EOF
endfunction

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Close buffer without exitting vim 
nnoremap <silent> <leader>bd :bp \| sp \| bn \| bd<CR>
nnoremap <silent> <C-a> gg<S-v>G
inoremap <silent> <C-a> <Esc>gg<S-v>G
map <silent> <C-Tab> :BufferLineCycleNext<CR>
map <silent> <C-S-w> :bdelete<CR>
nmap <silent> <C-S> :write<CR>
imap <silent> <C-S> <Esc>:write<CR>a
imap <silent> <S-Del> <Esc>:delete<CR>a
nmap <silent> <S-Del> :delete<CR>

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
if has("unix") && system("uname") =~? "Linux"
  let fcitx5state = system("fcitx5-remote")
  autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
  autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
endif
autocmd VimEnter * startinsert

if exists("g:neovide")
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_vfx_mode = "pixiedust"
endif
