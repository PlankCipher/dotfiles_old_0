require('plankcipher.settings')

-- Plugins
require('plankcipher.plugins.plugins')
require('plankcipher.plugins.colorscheme')
require('plankcipher.plugins.lualine')
require('plankcipher.plugins.terminal')
require('plankcipher.plugins.treesitter')
require('plankcipher.plugins.lspconfig')
require('plankcipher.plugins.cmp')
require('plankcipher.plugins.goto_preview')
require('plankcipher.plugins.markdown_preview')
require('plankcipher.plugins.telescope')
require('plankcipher.plugins.visual_multi')
require('plankcipher.plugins.comment')
require('plankcipher.plugins.formatting.formatting')

-- Keymappings
vim.g.mapleader = ' '

require('plankcipher.keymappings.navigation')
require('plankcipher.keymappings.terminal')
require('plankcipher.keymappings.lspconfig')
require('plankcipher.keymappings.goto_preview')
require('plankcipher.keymappings.markdown_preview')
require('plankcipher.keymappings.telescope')
require('plankcipher.keymappings.make_and_run')
require('plankcipher.keymappings.visual_multi')
