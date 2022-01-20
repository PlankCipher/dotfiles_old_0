-- NERDTree
vim.cmd('autocmd VimEnter * NERDTree | wincmd p')

vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''
vim.cmd([[
let NERDTreeShowHidden=1
let NERDTreeWinSize = 29
let NERDTreeMinimalUI = 1
]])

vim.cmd('autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')

vim.g.plug_window = 'noautocmd vertical topleft new'

-- Nerd Commenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

-- NERDTree Git Plugin
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeGitStatusShowIgnored = 1
