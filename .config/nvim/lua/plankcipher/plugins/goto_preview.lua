require('goto-preview').setup {
  width = 120;
  height = 21;
  -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
  border = {"", "" ,"", "", "", "", "", ""};
  resizing_mappings = true; -- Binds arrow keys to resizing the floating window.
  focus_on_open = true;
  post_open_hook = function(buffer, _)
    vim.cmd([[match LeadingSpaces /^ \+/]])
    vim.api.nvim_buf_set_keymap(buffer, 'n', '<Esc>', '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true });
  end,
}
