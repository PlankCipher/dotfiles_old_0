-- Automatically open/close quickfix window
-- based on errors output from `:make` command
vim.cmd([[autocmd QuickFixCmdPost [^l]* ++nested cwindow 20]])

-- Make (compile) and navigate errors/warnings
vim.api.nvim_set_keymap('n', '<leader>,',  ':set makeprg=', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>,,', ':make<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>,p', ':cp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>,n', ':cn<CR>', {noremap = true})

-- Run

-- This variable contains the Ex command to run your
-- program. It's optional to start it with a ':'.
vim.cmd([[let runprg = ':echoerr "`runprg` is not set, use <leader>. to set it"']])

vim.api.nvim_set_keymap('n', '<leader>.', ':let runprg = ', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>..', ':exe runprg<CR>', {noremap = true})

-- Make and Run
vim.api.nvim_set_keymap('n', '<leader>,.', ':make<CR><CR>:exe runprg<CR>', {noremap = true})
