execute pathogen#infect()

colorscheme obsidian
syntax on
filetype plugin indent on

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^for', '^cond']

map cqt :Require<CR>:Eval (clojure.test/run-tests)<CR>
map cqr :Require<CR>

set nu!

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

