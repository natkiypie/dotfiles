local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'rose-pine/neovim'
  use 'p00f/nvim-ts-rainbow'
  use 'terrortylor/nvim-comment'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'rmagatti/auto-session'
  use 'jpalardy/vim-slime'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'rbgrouleff/bclose.vim'
  use 'karb94/neoscroll.nvim'
  use { 'akinsho/bufferline.nvim', tag = '*' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'ggandor/lightspeed.nvim',
    requires = 'tpope/vim-repeat',
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
