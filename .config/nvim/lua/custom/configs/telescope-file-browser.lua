local fb_actions = require 'telescope._extensions.file_browser.actions'
require('telescope').setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        i = {
          ['<C-f>'] = require('telescope.actions').close,
          ['<C-n>'] = require('telescope.actions').close,
        },
        n = {
          ['<C-f>'] = require('telescope.actions').close,
          ['<C-n>'] = require('telescope.actions').close,
          ['h'] = fb_actions.goto_parent_dir,
          ['.'] = fb_actions.toggle_hidden,
        },
      },
    },
  },
}

require('telescope').load_extension 'file_browser'
