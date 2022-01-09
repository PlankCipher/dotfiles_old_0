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
hi! link CursorLine None
hi CocHighlightText ctermbg=237 guibg=#3c3836
hi CursorLineNr ctermbg=None guibg=None
hi VertSplit ctermbg=None guibg=None
hi SignColumn ctermbg=None guibg=None
hi ColorColumn ctermbg=None guibg=None
hi FloatermBorder ctermbg=None guibg=None

hi CocGitChangedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c
hi CocGitAddedSign ctermfg=234 ctermbg=234 guifg=#b8bb26 guibg=#b8bb26
hi CocGitRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934
hi CocGitTopRemovedSign ctermfg=234 ctermbg=234 guifg=#fb4934 guibg=#fb4934
hi CocGitChangeRemovedSign ctermfg=234 ctermbg=234 guifg=#8ec07c guibg=#8ec07c

hi CocErrorSign ctermbg=None guibg=None
hi CocWarningSign ctermbg=None guibg=None
hi CocInfoSign ctermbg=None guibg=None
hi CocHintSign ctermbg=None guibg=None
hi CocErrorVirtualText cterm=bold ctermfg=124 gui=bold guifg=#cc241d
hi CocWarningVirtualText cterm=bold ctermfg=172 gui=bold guifg=#d79921
hi CocInfoVirtualText cterm=bold ctermfg=66 gui=bold guifg=#458588

hi Todo ctermfg=208 ctermbg=234 gui=reverse guifg=#fe8019 guibg=#1d2021
