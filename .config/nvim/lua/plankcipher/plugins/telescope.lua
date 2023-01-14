local telescope = require('telescope')
local themes = require('telescope.themes')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local custom_actions = {}

function custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()

  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)

  local initial_bufnr = vim.api.nvim_get_current_buf()

  vim.cmd('silent cfdo ' .. open_cmd)

  if vim.api.nvim_buf_get_name(initial_bufnr) == '' then
    vim.api.nvim_buf_delete(initial_bufnr, {})
  end
end

function custom_actions.multi_selection_open(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "edit")
end

function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "vsplit")
  vim.api.nvim_cmd({cmd = 'quit', args = {}}, {})
end

function custom_actions.multi_selection_open_split(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "split")
  vim.api.nvim_cmd({cmd = 'quit', args = {}}, {})
end

function custom_actions.reset_prompt(prompt_bufnr)
  action_state.get_current_picker(prompt_bufnr):reset_prompt()
end

local multi_selection_i_mappings = {
  i = {
    ['<CR>'] = custom_actions.multi_selection_open,
    ['<C-v>'] = custom_actions.multi_selection_open_vsplit,
    ['<C-s>'] = custom_actions.multi_selection_open_split,
  }
}

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
        height = 0.8,
        preview_cutoff = 120,
        preview_width = 0.58,
        prompt_position = 'top',
      },
      vertical = {
        width = 0.9,
      },
    },
    sorting_strategy = 'ascending',
    prompt_prefix = '> ',
    dynamic_preview_title = true,
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
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['<C-u>'] = custom_actions.reset_prompt,
        ['<C-k>'] = actions.preview_scrolling_up,
        ['<C-j>'] = actions.preview_scrolling_down,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '--glob', '!node_modules', '--glob', '!.git'},
      mappings = multi_selection_i_mappings,
    },
    spell_suggest = {
      theme = 'dropdown',
      layout_config = {
        height = 0.5,
      },
    },
    live_grep = {mappings = multi_selection_i_mappings},
    buffers = {mappings = multi_selection_i_mappings},
    oldfiles = {mappings = multi_selection_i_mappings},
    quickfix = {mappings = multi_selection_i_mappings},
    loclist = {mappings = multi_selection_i_mappings},
    git_status = {mappings = multi_selection_i_mappings},
    lsp_definitions = {mappings = multi_selection_i_mappings},
    lsp_references = {mappings = multi_selection_i_mappings},
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
