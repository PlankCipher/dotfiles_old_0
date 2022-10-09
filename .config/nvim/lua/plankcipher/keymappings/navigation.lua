vim.keymap.set({'n', 'v'}, 'k', 'gk')
vim.keymap.set({'n', 'v'}, 'j', 'gj')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', '<leader>wk', '<C-W>k')
vim.keymap.set('n', '<leader>wj', '<C-W>j')
vim.keymap.set('n', '<leader>wh', '<C-W>h')
vim.keymap.set('n', '<leader>wl', '<C-W>l')

vim.keymap.set('n', '<leader>wK', '<C-W>K')
vim.keymap.set('n', '<leader>wJ', '<C-W>J')
vim.keymap.set('n', '<leader>wH', '<C-W>H')
vim.keymap.set('n', '<leader>wL', '<C-W>L')

vim.keymap.set('n', '<leader>wv', ':vs<CR>')
vim.keymap.set('n', '<leader>ws', ':sp<CR>')

vim.keymap.set('n', '<leader>h', ':bp<CR>')
vim.keymap.set('n', '<leader>l', ':bn<CR>')

vim.keymap.set('n', '<leader>wq', '<C-W>q')
vim.keymap.set('n', '<leader>bk', function() vim.api.nvim_buf_delete(0, {}) end)

local go_to_lua_config_file = function()
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
      if char == terminating_quote then
        break
      else
        filename = filename .. char
      end
    end
  end

  filename = HOME .. '/.config/nvim/lua/' .. filename:gsub('%.', '/') .. '.lua'
  vim.api.nvim_cmd({cmd = 'edit', args = {filename}}, {})
end

vim.keymap.set('n', 'gl', go_to_lua_config_file)

local open_complementary_file = function(vertical_split)
  local current_filepath = vim.fn.expand('%')

  local filepath_to_open = ''
  if vim.endswith(current_filepath, '.cpp') then
    filepath_to_open = current_filepath:sub(1, -4) .. 'h'
  elseif vim.endswith(current_filepath, '.h') then
    filepath_to_open = current_filepath:sub(1, -2) .. 'cpp'
  end

  if vertical_split then
    vim.api.nvim_cmd({cmd = 'vs', args = {filepath_to_open}}, {})
  else
    vim.api.nvim_cmd({cmd = 'sp', args = {filepath_to_open}}, {})
  end
end

vim.keymap.set('n', 'gh', function() open_complementary_file(true) end)
vim.keymap.set('n', 'gsh', function() open_complementary_file(false) end)
