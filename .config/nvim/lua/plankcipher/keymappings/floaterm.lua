vim.api.nvim_set_keymap('n', '<leader>p', ':FloatermNew --height=0.8 --width=0.8 --wintype=floating --autoclose=2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>/', ':FloatermNew --height=0.8 --width=0.8 --wintype=floating g++ % -o %:r && ./%:r<CR>', {noremap = true})
