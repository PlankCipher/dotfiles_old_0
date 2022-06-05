require('plankcipher.settings')

-- Plugins
require('plankcipher.plugins.plug')
require('plankcipher.plugins.colorscheme')
require('plankcipher.plugins.lualine')
require('plankcipher.plugins.polyglot')
require('plankcipher.plugins.dashboard')
require('plankcipher.plugins.fzf')
require('plankcipher.plugins.nerd')
require('plankcipher.plugins.markdown_preview')
require('plankcipher.plugins.nvim_lspconfig')
require('plankcipher.plugins.nvim_cmp')
require('plankcipher.plugins.nvim_treesitter')
require('plankcipher.plugins.formatters')
require('plankcipher.plugins.gitsigns')
require('plankcipher.plugins.goto_preview')

-- Keymappings
vim.g.mapleader = ' '

require('plankcipher.keymappings.buffer_navigation')
require('plankcipher.keymappings.fzf')
require('plankcipher.keymappings.floaterm')
require('plankcipher.keymappings.make_and_run')
require('plankcipher.keymappings.nerd')
require('plankcipher.keymappings.markdown_preview')
require('plankcipher.keymappings.vim_fugitive')
require('plankcipher.keymappings.colorscheme')
require('plankcipher.keymappings.goto_preview')
