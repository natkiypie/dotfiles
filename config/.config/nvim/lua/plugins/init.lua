local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use 'neovim/nvim-lspconfig'
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'voldikss/vim-floaterm'
  use 'kyazdani42/nvim-web-devicons'
  use 'rmagatti/auto-session'
  use 'rmagatti/session-lens'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  -- Temporary
  use {
    'ggandor/lightspeed.nvim',
    requires = 'tpope/vim-repeat'
  }

  use 'ThePrimeagen/vim-be-good'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
