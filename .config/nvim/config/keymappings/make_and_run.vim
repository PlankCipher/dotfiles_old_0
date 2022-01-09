" Automatically open/close quickfix window
" based on errors output from `:make` command
autocmd QuickFixCmdPost [^l]* ++nested cwindow 20

" Make (compile) and navigate errors/warnings
nnoremap <leader>, :set makeprg=
nnoremap <leader>,, :make<CR>
nnoremap <leader>,p :cp<CR>
nnoremap <leader>,n :cn<CR>

" Run

" This variable contains the Ex command to run your
" program. It's optional to start it with a ':'.
let runprg = ':echoerr "`runprg` is not set, use <leader>. to set it"'

nnoremap <leader>. :let runprg = 
nnoremap <leader>.. :exe runprg<CR>
