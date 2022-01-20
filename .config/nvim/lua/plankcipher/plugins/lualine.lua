function is_actual_file()
  return (vim.bo.filetype ~= 'dashboard') and (vim.bo.filetype ~= 'vim-plug') and (vim.bo.filetype ~= 'nerdtree')
end

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' +',
          readonly = ' 🔒',
          unnamed = '',
        },
        cond = is_actual_file
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        sections = { 'error', 'warn', 'info', 'hint' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
        symbols = {error = '❌:', warn = '⚠ :', info = 'ℹ :', hint = '💡:'},
        colored = false,
        update_in_insert = true,
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {}
})
