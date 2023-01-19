vim.api.nvim_cmd({cmd = 'filetype', args = {'plugin', 'indent', 'on'}}, {})
vim.opt.list = true
vim.opt.listchars = {trail = '~', lead = '·', tab = ' ', eol = '↲'}
vim.opt.history = 500
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.switchbuf = 'usetab'
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.modeline = false
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 5
vim.opt.foldenable = false
vim.opt.shortmess:append('cAI')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.updatetime = 100
vim.opt.wildmode = 'longest,full'
vim.opt.wildignore:append('*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem')
vim.opt.wildignore:append('*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*')
vim.opt.wildignore:append('*.swp,*~,._*')
vim.opt.wildoptions = 'pum'
vim.opt.pumheight = 20
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.guicursor = 'n-v-sm-ve:block,i-c-ci:ver25,r-cr-o:hor20'
vim.opt.termguicolors = true
vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 5
vim.opt.spell = true
vim.opt.spelloptions = 'camel'
vim.opt.spellcapcheck = ''
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.mouse = ''
vim.opt.shellpipe = '2>&1| tee %s ; exit $pipestatus[1]'

vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold'}, {
  pattern = '*',
  command = 'if !bufexists("[Command Line]") | checktime | endif'
})
