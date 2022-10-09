local telescope = require('telescope')
local themes = require('telescope.themes')

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
        height = 0.8,
        preview_cutoff = 120,
        prompt_position = 'top',
      },
      vertical = {
        width = 0.9,
      },
    },
    sorting_strategy = 'ascending',
    prompt_prefix = '',
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--smart-case',
      '--glob', '!node_modules',
      '--glob', '!.git',
      '--glob', '!LICENSE',
    },
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '--glob', '!node_modules', '--glob', '!.git'}
    },
    spell_suggest = {
      theme = 'dropdown',
      layout_config = {
        height = 0.5,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      themes.get_dropdown({
        layout_config = {
          width = 0.5,
          height = 0.4,
        }
      })
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
