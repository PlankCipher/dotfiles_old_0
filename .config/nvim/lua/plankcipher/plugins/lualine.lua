require('lualine').setup({
  options = {
    theme = 'gruvbox_dark',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    always_divide_middle = false,
    refresh = {statusline = 300}
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str) return str:sub(1,1) end,
      }
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
          newfile = '',
        }
      },
      {
        'branch',
        separator = '',
        icon = {''},
      },
      {
        'diff',
        padding = {left = 0, right = 1},
      }
    },
    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        },
        update_in_insert = true,
      }
    },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        icons_enabled = false,
      },
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
          newfile = '',
        }
      },
    },
    lualine_x = {},
  },
})