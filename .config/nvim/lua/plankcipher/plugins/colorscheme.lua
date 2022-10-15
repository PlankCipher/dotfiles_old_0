if vim.fn.empty(vim.env.TMUX) == 1 then
  if vim.fn.has('nvim') == 1 then
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end
end

vim.g.gruvbox_contrast_dark = 'hard'
vim.api.nvim_cmd({cmd = 'colorscheme', args = {'gruvbox'}}, {})

local hl = function(hl_group, value)
  vim.api.nvim_set_hl(0, hl_group, value)
end

hl('Normal', {ctermfg = 223, ctermbg = 'None', fg = '#ebdbb2', bg = 'None'})
hl('SignColumn', {ctermbg = 'None', bg = 'None'})
hl('VertSplit', {ctermfg = 241, ctermbg = 'None', fg = '#665c54', bg = 'None'})
hl('markdownError', {link = 'None'})

hl('CursorLineNr', {ctermfg = 214, ctermbg = 'None', fg = '#fabd2f', bg = 'None'})
hl('CursorLine', {ctermbg = 238, bg = '#444444'})

hl('CurSearch', {link = 'IncSearch'})

hl('NonText', {ctermfg = 242, ctermbg = 'None', fg = '#6c6c6c', bg = 'None'})
hl('TrailingWhitespace', {ctermfg = 'white', ctermbg = 'red', fg = '#ffffff', bg = '#ff0000', bold = true})

vim.api.nvim_cmd({cmd = 'match', args = {'TrailingWhitespace', [[/\s\+$/]]}}, {})
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.ft
    if ft ~= '' and ft ~= 'TelescopePrompt' and ft ~= 'help' then
      vim.api.nvim_cmd({cmd = 'match', args = {'TrailingWhitespace', [[/\s\+$/]]}}, {})
    end
  end,
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

hl('DiagnosticVirtualTextError', {ctermfg = 1, fg = '#ff0000', bg = '#581818'})
hl('DiagnosticVirtualTextHint', {ctermfg = 7, fg = '#d3d3d3', bg = '#4c4f4f'})
hl('DiagnosticVirtualTextWarn', {ctermfg = 3, fg = '#ffa500', bg = '#584318'})
hl('DiagnosticVirtualTextInfo', {ctermfg = 4, fg = '#add8e6', bg = '#425054'})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 100})
  end,
})
