if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

hi Whitespace ctermfg=White ctermbg=Red guifg=#FFFFFF guibg=#FF0000
hi LeadingSpaces ctermfg=242 ctermbg=None guifg=#6c6c6c guibg=None
match LeadingSpaces /^ \+/

hi Normal ctermbg=None guibg=None
hi CursorLineNr ctermbg=None guibg=None
hi VertSplit ctermbg=None guibg=None
hi SignColumn ctermbg=None guibg=None
hi ColorColumn ctermbg=None guibg=None
hi GitGutterAdd ctermbg=None guibg=None
hi GitGutterChange ctermbg=None guibg=None
hi GitGutterDelete ctermbg=None guibg=None
hi GitGutterChangeDelete ctermbg=None guibg=None
hi CocErrorSign ctermbg=None guibg=None
hi CocWarningSign ctermbg=None guibg=None
hi CocInfoSign ctermbg=None guibg=None
hi CocHintSign ctermbg=None guibg=None
hi FloatermBorder ctermbg=None guibg=None

hi CocGitChangedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c
hi CocGitAddedSign ctermfg=234 ctermbg=234 guifg=#b8bb26 guibg=#b8bb26
hi CocGitRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934
hi CocGitTopRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934
hi CocGitChangeRemovedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c

hi Todo ctermfg=208 ctermbg=234 gui=reverse guifg=#fe8019 guibg=#1d2021
hi CocCodeLens ctermfg=245 ctermbg=237 guifg=#928374 guibg=#3c3836
