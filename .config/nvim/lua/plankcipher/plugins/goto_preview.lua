require('goto-preview').setup({
  width = 120,
  height = 21,
  border = {'↖', '─', '╮', '│', '╯', '─', '╰', '│'},
  resizing_mappings = true,
  post_open_hook = function(buffer, _)
    vim.keymap.set('n', '<Esc>', require('goto-preview').close_all_win, {buffer = buffer});
  end,
})
