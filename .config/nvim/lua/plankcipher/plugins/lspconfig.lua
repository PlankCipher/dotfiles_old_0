local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local bufopts = {noremap=true, silent=true, buffer=bufnr}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

  if client.server_capabilities.documentHighlightProvider then
    local highlight = {ctermbg = 'red', fg = '#fbf1c7', bg = '#66542a'}
    vim.api.nvim_set_hl(0, 'LspReferenceRead', highlight)
    vim.api.nvim_set_hl(0, 'LspReferenceText', highlight)
    vim.api.nvim_set_hl(0, 'LspReferenceWrite', highlight)

    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd('CursorHold', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local lsp_flags = {
  debounce_text_changes = 100,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {'html', 'cssls', 'emmet_ls', 'tsserver', 'clangd', 'pyright'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  })
end

lspconfig.eslint.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    packageManager = 'yarn',
  }
})

vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = 'ﱢ',
  },
  float = {
    source = true,
    border = 'rounded',
  },
  update_in_insert = true,
  severity_sort = true,
})

local signs = {Error = '', Warn = '', Hint = '', Info = ''}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
