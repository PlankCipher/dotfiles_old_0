vim.api.nvim_set_keymap('n', '<leader>ds', ':Gvdiffsplit<CR> <C-W><C-W>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':q <BAR> bn <BAR> bp <BAR> bd #<CR>', {noremap = true})
