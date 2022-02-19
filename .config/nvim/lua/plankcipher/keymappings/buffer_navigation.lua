vim.api.nvim_set_keymap('n', '<leader>h', ':bprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':enew<CR>' , {})
vim.api.nvim_set_keymap('n', '<leader>q', ':bp <BAR> bd #<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>s', '<C-W><C-W>', {noremap = true})

function goToLuaConfigFile()
  local HOME = os.getenv('HOME')

  local current_line = vim.fn.getline('.')

  local filename = ''
  local terminating_quote = ''
  for i = 1, #current_line do
    local char = current_line:sub(i,i)
    if terminating_quote == '' then
      if char == '"' or char == "'" then
        terminating_quote = char
      end
    else
      if char == '"' or char == "'" then
        break
      else
        filename = filename .. char
      end
    end
  end

  filename = HOME .. '/.config/nvim/lua/' .. filename:gsub('%.', '/') .. '.lua'
  vim.cmd('edit ' .. filename)
end

vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua goToLuaConfigFile()<CR>', {noremap = true})

function vertSplitHeaderFile()
  local current_filepath = vim.fn.expand('%')
  if vim.endswith(current_filepath, '.cpp') then
    local header_filepath = current_filepath:sub(1, -4) .. 'h'
    vim.cmd('vs ' .. header_filepath)
    vim.cmd([[match LeadingSpaces /^ \+/]])
  end
end

vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vertSplitHeaderFile()<CR>', {noremap = true})
