function! DiagnosticSummary() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . ':' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . ':' . info['warning'])
  endif
  if get(info, 'information', 0)
    call add(msgs, 'I' . ':' . info['information'])
  endif
  return join(msgs, ' ')
endfunction

function! LightlineFileName()
  let l:filePath = expand('%')
  if winwidth(0) > 150
    return l:filePath
  else
    return pathshorten(l:filePath)
  endif
endfunction

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['gitbranch', 'readonly', 'filename', 'modified'],
  \             ['diagnostic_summary'] ],
  \   'right': [ [ 'lineinfo' ], ['percent'],
  \               [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'diagnostic_summary': 'DiagnosticSummary',
  \   'filename': 'LightlineFileName'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': []
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ }
  \ }

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
