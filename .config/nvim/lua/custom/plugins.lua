local overrides = require 'custom.overrides'

local plugins = {
  {
    'dkarter/bullets.vim',
    ft = {
      'markdown',
      'text',
    },
  },
  {
    'numToStr/Comment.nvim',
    enabled = false,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'custom.configs.conform'
    end,
  },
  {
    'CRAG666/code_runner.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'custom.configs.code_runner'
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = overrides.gitsigns,
  },
  {
    'ggandor/leap.nvim',
    lazy = false,
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = overrides.mason,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'tsserver',
          'html',
          'cssls',
        },
        automatic_installation = true,
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    lazy = false,
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'prettier',
          'stylua',
          'eslint_d',
        },
      }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>' },
    config = function()
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>' },
        hide_cursor = false,
      }
    end,
  },
  {
    'terrortylor/nvim-comment',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('nvim_comment').setup {
        create_mappings = false,
        comment_empty = false,
      }
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    opts = overrides.cmp,
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'custom.configs.nvim-lint'
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'jay-babu/mason-null-ls.nvim' },
    config = function()
      require 'custom.configs.none-ls'
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = overrides.nvimtree,
  },
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        app = 'browser',
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = overrides.telescope,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'custom.configs.telescope-file-browser'
    end,
  },
  {
    'nvim-telescope/telescope-symbols.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'tpope/vim-fugitive',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'folke/which-key.nvim',
    enabled = false,
  },
}

return plugins
