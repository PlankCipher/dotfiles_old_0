let g:coc_global_extensions = [
  \'coc-html',
  \'coc-json',
  \'coc-spell-checker',
  \'coc-emmet',
  \'coc-eslint',
  \'coc-css',
  \'coc-prettier',
  \'coc-tsserver',
  \'coc-git',
  \'coc-pairs',
  \'coc-highlight',
  \'coc-clangd',
  \'coc-sh',
  \]

autocmd CursorHold * silent call CocActionAsync('highlight')
