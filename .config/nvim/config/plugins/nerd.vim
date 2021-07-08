"""""""""""""""""NERDTREE"""""""""""""""""
autocmd VimEnter * NERDTree | wincmd p

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowHidden=1
let NERDTreeWinSize = 29
let NERDTreeMinimalUI = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:plug_window = 'noautocmd vertical topleft new'

"""""""""""""""""NERDCOMMENTER"""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"""""""""""""""""NERDTREE_GIT_PLUGIN"""""""""""""""""
let g:NERDTreeGitStatusShowIgnored = 1
