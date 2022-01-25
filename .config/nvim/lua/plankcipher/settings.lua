local HOME = os.getenv("HOME")

vim.cmd('filetype plugin indent on')
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = HOME .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.signcolumn = 'yes'
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.ignorecase = true
vim.opt.autoread = true
vim.opt.updatetime = 100
vim.opt.list = true
vim.opt.listchars = {trail = '~', lead = '·'}
vim.opt.guicursor = ''
vim.opt.spell = true
vim.opt.spelloptions = 'camel'
vim.opt.spellcapcheck = ''
