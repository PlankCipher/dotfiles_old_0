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
  command = [[silent match TrailingWhitespace /\s\+$/]],
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  command = 'match none',
})

hl('ColorColumn', {ctermbg = 226, bg = '#555555'})
hl('Todo', {ctermfg = 234, ctermbg = 208, fg = '#1d2021', bg = '#fe8019', bold = true})

hl('Pmenu', {ctermfg = 223, ctermbg = 'None', fg = '#ebdbb2', bg = 'None'})
hl('NormalFloat', {ctermfg = 223, ctermbg = 'None', fg = '#ebdbb2', bg = 'None'})
hl('FloatBorder', {link = 'NormalFloat'})

hl('CmpItemAbbrMatch', {link = 'Special'})
hl('CmpItemAbbrMatchFuzzy', {link = 'CmpItemAbbrMatch'})
hl('CmpItemKind', {link = 'Keyword'})
hl('CmpItemMenu', {link = 'CmpItemAbbrDeprecated'})

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

hl('DiagnosticUnderlineError', {sp = '#ff0000', underline = true})
hl('DiagnosticUnderlineHint', {sp = '#d3d3d3', underline = true})
hl('DiagnosticUnderlineWarn', {sp = '#ffa500', underline = true})
hl('DiagnosticUnderlineInfo', {sp = '#add8e6', underline = true})

hl('LspSignatureActiveParameter', {ctermbg = 238, bg = '#444444', bold = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 100})
  end,
})

local ts_highlights = {
  ['@annotation'] = {link = 'PreProc'},
  ['@attribute'] = {link = 'PreProc'},
  ['@boolean'] = {link = 'Boolean'},
  ['@character'] = {link = 'Character'},
  ['@character.special'] = {link = 'SpecialChar'},
  ['@comment'] = {link = 'Comment'},
  ['@conditional'] = {link = 'Conditional'},
  ['@constant'] = {link = 'Constant'},
  ['@constant.builtin'] = {link = 'Special'},
  ['@constant.macro'] = {link = 'Define'},
  ['@constructor'] = {link = 'Special'},
  ['@debug'] = {link = 'Debug'},
  ['@define'] = {link = 'Define'},
  ['@exception'] = {link = 'Exception'},
  ['@field'] = {link = 'Identifier'},
  ['@float'] = {link = 'Float'},
  ['@function'] = {link = 'Function'},
  ['@function.builtin'] = {link = 'Special'},
  ['@function.call'] = {link = 'Function'},
  ['@function.macro']  = {link = 'Macro'},
  ['@include'] = {link = 'Include'},
  ['@none'] = {bg = 'NONE', fg = 'NONE'},
  ['@keyword'] = {link = 'Keyword'},
  ['@keyword.function'] = {link = 'Keyword'},
  ['@keyword.operator'] = {link = 'Keyword'},
  ['@keyword.return'] = {link = 'Keyword'},
  ['@label'] = {link = 'Label'},
  ['@method'] = {link = 'Function'},
  ['@method.call'] = {link = 'Function'},
  ['@namespace'] = {link = 'Include'},
  ['@number'] = {link = 'Number'},
  ['@operator'] = {link = 'Operator'},
  ['@parameter'] = {link = 'Identifier'},
  ['@parameter.reference'] = {link = 'Identifier'},
  ['@preproc'] = {link = 'PreProc'},
  ['@property'] = {link = 'Identifier'},
  ['@punctuation.bracket'] = {link = 'Delimiter'},
  ['@punctuation.delimiter'] = {link = 'Delimiter'},
  ['@punctuation.special'] = {link = 'Delimiter'},
  ['@repeat'] = {link = 'Repeat'},
  ['@storageclass'] = {link = 'StorageClass'},
  ['@string'] = {link = 'String'},
  ['@string.escape'] = {link = 'SpecialChar'},
  ['@string.regex'] = {link = 'String'},
  ['@string.special'] = {link = 'SpecialChar'},
  ['@symbol'] = {link = 'Identifier'},
  ['@tag'] = {link = 'Label'},
  ['@tag.attribute'] = {link = 'Identifier'},
  ['@tag.delimiter'] = {link = 'Delimiter'},
  ['@text'] = {link = 'Normal'},
  ['@text.danger'] = {link = 'ErrorMsg'},
  ['@text.emphasis'] = {italic = true},
  ['@text.environment'] = {link = 'Macro'},
  ['@text.environment.name'] = {link = 'Type'},
  ['@text.literal'] = {link = 'String'},
  ['@text.math'] = {link = 'Special'},
  ['@text.note'] = {link = 'Todo'},
  ['@text.reference'] = {link = 'Constant'},
  ['@text.strike'] = {strikethrough = true},
  ['@text.strong'] = {bold = true},
  ['@text.title'] = {link = 'Title'},
  ['@text.underline'] = {underline = true},
  ['@text.uri'] = {link = 'Underlined'},
  ['@text.warning'] = {link = 'Todo'},
  ['@todo'] = {link = 'Todo'},
  ['@type'] = {link = 'Type'},
  ['@type.builtin'] = {link = 'Type'},
  ['@type.definition'] = {link = 'Typedef'},
  ['@type.qualifier'] = {link = 'Type'},
  ['@variable'] = {link = 'Normal'},
  ['@variable.builtin'] = {link = 'Special'},
}

for hl_group, value in pairs(ts_highlights) do
  value.default = true
  hl(hl_group, value)
end
