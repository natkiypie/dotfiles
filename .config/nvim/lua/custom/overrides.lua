local M = {}

local cmp = require 'cmp'

--Cmp
M.cmp = {
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-c>'] = cmp.mapping.complete(),
    ['<C-l>'] = cmp.mapping.confirm { select = false },
    ['<tab>'] = cmp.mapping.confirm { select = false },
    ['<CR>'] = {},
  },
}

--Git Signs
M.gitsigns = {
  on_attach = function(bufnr)
    if vim.api.nvim_buf_get_name(bufnr):match 'norg' then
      return false
    end
  end,
}

--Mason
M.mason = {
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
}

--Nvim Tree
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

--Telescope
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
          ['<C-n>'] = require('telescope.actions').close,
        },
        n = {
          ['<C-f>'] = require('telescope.actions').close,
          ['<C-n>'] = require('telescope.actions').close,
        },
      },
    },
    git_branches = {
      mappings = {
        i = {
          ['<leader>b'] = require('telescope.actions').close,
        },
        n = {
          ['<leader>b'] = require('telescope.actions').close,
        },
      },
    },
    current_buffer_fuzzy_find = {
      mappings = {
        n = {
          ['<C-s>'] = require('telescope.actions').close,
        },
        i = {
          ['<C-s>'] = require('telescope.actions').close,
        },
      },
    },
    jumplist = {
      mappings = {
        n = {
          ['<C-j>'] = require('telescope.actions').close,
        },
        i = {
          ['<C-j>'] = require('telescope.actions').close,
        },
      },
    },
    marks = {
      mappings = {
        n = {
          ['<leader>m'] = require('telescope.actions').close,
        },
        i = {
          ['<leader>m'] = require('telescope.actions').close,
        },
      },
    },
  },
}

return M
