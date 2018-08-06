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

" We use fast computers, let's bump the paren depth
let g:rbpt_max = 32

map cqt :Require<CR>:Eval (clojure.test/run-tests)<CR>
map cqr :Require<CR>

" Bind F6 to recompute cyclomatic complexity for a file.
nnoremap <silent> <F6> :Complexity<CR>

" global behaviour
set nu
set expandtab
set clipboard=unnamed
set guioptions= " disable scrollbars

" default behaviour
set tabstop=2 
set shiftwidth=2 

" per file type behaviour
au FileType python setl sw=4 sts=4 ts=4 et
au FileType php setl sw=4 sts=4 ts=4 smartindent et
au FileType tex English

" Make ctrlp ignore useless files
set wildignore+=*.pyc,*.swp
let g:ctrlp_custom_ignore = {
\  'dir': '',
\  'file': '\v\.(pyc|swp)$' }

" Make the paren matching plugin work with django templates
let g:mta_filetypes = {
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'jinja' : 1,
\ 'htmldjango': 1
\}

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:jsx_ext_required = 0

let NERDTreeIgnore = ['\.pyc$']

nmap <silent> <Tab> :wincmd w<CR>
nmap <silent> <S-Tab> :wincmd W<CR>
map <C-t> :NERDTreeToggle<CR>

function! English()
  call pencil#init({'wrap': 'soft'})
  set spell
endfunction

command! -nargs=0 English call English()

" Reload vimrc file. I should have done this years ago
if exists('*ReloadVimRC') == 0
  function ReloadVimRC()
    so ~/.vimrc
  endfunction
end

command! -nargs=0 Reload call ReloadVimRC()

" Enable cursorline in normal mode
let g:lanny_cursorline = 1

if g:lanny_cursorline
  set cursorline
end

highlight CursorLine guibg=#4f0402
highlight CursorLineNR guibg=#4f0402 guifg=#ffd77a

function! CondCurLin()
  if g:lanny_cursorline
    set cursorline
  else
    set nocursorline
  end
endfunction

autocmd InsertEnter * set nocursorline
autocmd InsertLeave * call CondCurLin()

autocmd WinEnter * set cursorline
autocmd WinLeave * call CondCurLin()

function! ToggleCursorLine()
  if g:lanny_cursorline
    let g:lanny_cursorline = 0
    set nocursorline
  else
    let g:lanny_cursorline = 1
    set cursorline
  end
endfunction

nmap <silent> C :call ToggleCursorLine()<CR>
