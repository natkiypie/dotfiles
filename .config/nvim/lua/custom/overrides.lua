local M = {}

local cmp = require 'cmp'

M.cmp = {
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-c>'] = cmp.mapping.complete(),
    ['q'] = cmp.mapping.abort(),
    ['<C-l>'] = cmp.mapping.confirm { select = false },
  },
}

M.mason = {
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
}

M.nvimtree = {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  on_attach = function(bufnr)
    local api = require 'nvim-tree.api'

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<C-e>', api.tree.close, opts 'Close')
    vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Directory')
    vim.keymap.set('n', 's', '', opts '')
  end,
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-l>'] = require('telescope.actions').select_default,
        ['<C-q>'] = require('telescope.actions').close,
      },
      n = {
        ['l'] = require('telescope.actions').select_default,
      },
    },
  },
  pickers = {
    find_files = {
      mappings = {
        i = {
          ['<C-f>'] = require('telescope.actions').close,
        },
        n = {
          ['<C-f>'] = require('telescope.actions').close,
        },
      },
    },
    git_branches = {
      mappings = {
        i = {
          ['<space>b'] = require('telescope.actions').close,
        },
        n = {
          ['<space>b'] = require('telescope.actions').close,
        },
      },
    },
  },
}

return M