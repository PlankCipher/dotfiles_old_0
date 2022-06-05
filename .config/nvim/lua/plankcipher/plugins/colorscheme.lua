if vim.fn.empty(vim.env.TMUX) == 1 then
  if vim.fn.has('nvim') == 1 then
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end

  if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
  end
end

vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 80})
augroup END
]])

vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('colorscheme gruvbox')

vim.cmd('hi Whitespace ctermfg=White ctermbg=Red guifg=#FFFFFF guibg=#FF0000')
vim.cmd('hi LeadingSpaces ctermfg=242 ctermbg=None guifg=#6c6c6c guibg=None')

vim.cmd([[
augroup highlight_leading_spaces
    autocmd!
    autocmd WinEnter * silent! match LeadingSpaces /^ \+/
augroup END
match LeadingSpaces /^ \+/
]])

vim.cmd('hi Normal ctermbg=None guibg=None')
vim.cmd('hi! link CursorLine None')
vim.cmd('hi CursorLineNr ctermbg=None guibg=None')
vim.cmd('hi VertSplit ctermbg=None guibg=None')
vim.cmd('hi SignColumn ctermbg=None guibg=None')
vim.cmd('hi ColorColumn ctermbg=None guibg=None')
vim.cmd('hi FloatermBorder ctermfg=208 ctermbg=None guifg=#fe8019 guibg=None')

vim.cmd('hi GitAddedSign ctermfg=234 ctermbg=234 guifg=#b8bb26 guibg=#b8bb26')
vim.cmd('hi GitChangedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c')
vim.cmd('hi GitRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934')
vim.cmd('hi GitTopRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934')
vim.cmd('hi GitChangeRemovedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c')

vim.cmd('hi DiagnosticVirtualTextError cterm=bold ctermfg=124 gui=bold guifg=#cc241d')
vim.cmd('hi DiagnosticVirtualTextWarning cterm=bold ctermfg=172 gui=bold guifg=#d79921')
vim.cmd('hi DiagnosticVirtualTextInfo cterm=bold ctermfg=66 gui=bold guifg=#458588')
vim.cmd('hi DiagnosticVirtualTextHint cterm=bold ctermfg=66 gui=bold guifg=#458588')

vim.cmd('hi Todo ctermfg=208 ctermbg=234 gui=reverse guifg=#fe8019 guibg=#1d2021')
