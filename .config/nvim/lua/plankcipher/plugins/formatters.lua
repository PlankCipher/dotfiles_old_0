-- prettier
vim.cmd([[autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier]])

vim.g['prettier#config#trailing_comma'] = 'all'
vim.g['prettier#config#single_quote'] = true
vim.g['prettier#quickfix_enabled'] = false

-- clang-format
vim.cmd([[autocmd BufWritePre *.c,*.cpp,*.h lua vim.lsp.buf.formatting_sync()]])
