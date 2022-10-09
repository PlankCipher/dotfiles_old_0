if vim.fn.empty(vim.env.TMUX) == 1 then
  if vim.fn.has('nvim') == 1 then
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end
end

vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

local hl = function(hl_group, value)
  vim.api.nvim_set_hl(0, hl_group, value)
end

hl('Normal', {ctermfg = 223, ctermbg = 'None', fg = '#ebdbb2', bg = 'None'})
hl('SignColumn', {ctermbg = 'None', bg = 'None'})
hl('VertSplit', {ctermfg = 241, ctermbg = 'None', fg = '#665c54', bg = 'None'})

hl('CursorLineNr', {ctermfg = 214, ctermbg = 'None', fg = '#fabd2f', bg = 'None'})
hl('CursorLine', {ctermbg = 238, bg = '#444444'})

hl('CurSearch', {link = 'IncSearch'})

hl('NonText', {ctermfg = 242, ctermbg = 'None', fg = '#6c6c6c', bg = 'None'})
hl('TrailingWhitespace', {ctermfg = 'white', ctermbg = 'red', fg = '#ffffff', bg = '#ff0000', bold = true})

vim.cmd([[silent match TrailingWhitespace /\s\+$/]])
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  command = [[silent match TrailingWhitespace /\s\+$/]],
})

hl('ColorColumn', {ctermbg = 226, bg = '#555555'})
hl('Todo', {ctermfg = 234, ctermbg = 208, fg = '#1d2021', bg = '#fe8019', bold = true})

hl('NormalFloat', {ctermfg = 223, ctermbg = 239, fg = '#ebdbb2', bg = '#504945', blend = 17})
hl('FloatBorder', {link = 'NormalFloat'})

hl('TelescopeBorder', {ctermfg = 208, fg = '#fe8019'})
hl('TelescopeSelection', {link = 'CursorLine'})
hl('TelescopeSelectionCaret', {ctermfg = 208, ctermbg = 238, fg = '#fe8019', bg = '#444444', bold = true})

hl('GitSignsAdd', {fg='#b8bb26', bg='#b8bb26'})
hl('GitSignsChange', {fg='#8ec07c', bg='#8ec07c'})
hl('GitSignsDelete', {fg='#fb4934', bg='#fb4934'})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 100})
  end,
})
