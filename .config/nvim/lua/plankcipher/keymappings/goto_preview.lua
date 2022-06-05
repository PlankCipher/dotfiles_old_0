vim.api.nvim_set_keymap('n', 'gpd',  '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', { noremap = true});
vim.api.nvim_set_keymap('n', 'gpi',  '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', { noremap = true});
