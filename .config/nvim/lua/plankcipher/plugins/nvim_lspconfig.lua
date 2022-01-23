local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local default_config = {
  on_attach = on_attach,
  capabilities = capabilities
}

local servers = {
  { name = 'html', config = default_config },
  { name = 'tsserver', config = default_config },
  { name = 'emmet_ls', config = default_config },
  { name = 'clangd', config = default_config },
  {
    name = 'cssls',
    config = {
      filetypes = { "css" },
      settings = {
        less = {
          validate = false
        },
        scss = {
          validate = false
        }
      },
      on_attach = on_attach,
      capabilities = capabilities
    }
  },
  {
    name = 'eslint',
    config = {
      format = false,
      packageManager = 'yarn',
      on_attach = on_attach,
      capabilities = capabilities
    }
  }
}

for _, server in ipairs(servers) do
  nvim_lsp[server.name].setup(server.config)
end

-- Diagnostics (UI)
vim.diagnostic.config({
  update_in_insert = true,
  severity_sort = true,
  virtual_text = {
    prefix = 'ﱢ'
  }
})

local signs = { Error = '❌', Warn = '⚠ ', Info = 'ℹ ', Hint = '💡' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
