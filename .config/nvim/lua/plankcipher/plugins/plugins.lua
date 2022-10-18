local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_cmd({cmd = 'packadd', args = {'packer.nvim'}}, {})
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use('wbthomason/packer.nvim')

  use({
    'lewis6991/impatient.nvim',
    config = function() require('impatient') end
  })

  use('morhetz/gruvbox')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim')
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use({
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  })

  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('L3MON4D3/LuaSnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('rmagatti/goto-preview')

  use('numToStr/Comment.nvim')

  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = 'markdown',
  })

  use('sbdchd/neoformat')

  use({
    'nvim-telescope/telescope.nvim', tag = '*',
    requires = {'nvim-lua/plenary.nvim'}
  })
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({'nvim-telescope/telescope-ui-select.nvim'})

  use('tpope/vim-surround')
  use('mg979/vim-visual-multi')

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({border = 'single'})
    end
  }
}})
