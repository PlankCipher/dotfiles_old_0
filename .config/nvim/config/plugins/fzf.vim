let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline -i'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!node_modules' --glob '!.git'"

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --line-number --no-heading --color=always --smart-case --glob "!node_modules" --glob "!.git" --glob "!LICENSE" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \{ 'fg':      ['fg', 'Normal'],
  \  'bg':      ['bg', 'Normal'],
  \  'hl':      ['fg', 'Comment'],
  \  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \  'hl+':     ['fg', 'Statement'],
  \  'info':    ['fg', 'PreProc'],
  \  'border':  ['fg', 'VertSplit'],
  \  'prompt':  ['fg', 'Conditional'],
  \  'pointer': ['fg', 'Exception'],
  \  'marker':  ['fg', 'Keyword'],
  \  'spinner': ['fg', 'Label'],
  \  'header':  ['fg', 'Comment'] }
