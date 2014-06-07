execute pathogen#infect()

colorscheme obsidian
syntax on
filetype plugin indent on

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^for', 
                                      \ '^cond', '^select', '^insert',
                                      \ '^update', '^delete']

map cqt :Require<CR>:Eval (clojure.test/run-tests)<CR>
map cqr :Require<CR>

" global behaviour
set nu!
set expandtab
set clipboard=unnamed

" default behaviour
set tabstop=2 
set shiftwidth=2 

" per file type behaviour
" au FileType python setl sw=4 sts=4 ts=4 et

" Make ctrlp ignore useless files
set wildignore+=*.pyc,*.swp
let g:ctrlp_custom_ignore = {
\  'dir': '',
\  'file': '\v\.(pyc|swp)$' }

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

