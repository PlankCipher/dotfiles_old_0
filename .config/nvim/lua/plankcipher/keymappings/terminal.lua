local open_terminal = function(close_on_0_status, command)
  vim.g.close_on_0_status = close_on_0_status
  vim.cmd('te' .. (command and (' ' .. command) or ''))
end

vim.keymap.set('n', '<leader>ot', function() open_terminal(true) end)
vim.keymap.set('n', '<leader>of', function() open_terminal(true, 'ranger') end)
vim.keymap.set('n', '<leader>or', function() open_terminal(false, 'g++ % -o %:r && ./%:r') end)
