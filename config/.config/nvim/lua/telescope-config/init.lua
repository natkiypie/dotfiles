require 'telescope-config/keybindings'
require 'telescope-config/highlights'

local actions = require 'telescope.actions'

local function fb_action(f)
  return function(b)
    require('telescope').extensions.file_browser.actions[f](b)
  end
end

local fb_keybindings = {}

require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    find_command = { 'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = ' ',
    initial_mode = 'normal',
    results_title = '',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = false,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
    mappings = {
      i = {
        ['J'] = actions.move_selection_next,
        ['K'] = actions.move_selection_previous,
        ['L'] = actions.select_default + actions.center,
        ['Q'] = actions.close,
        ['<esc>'] = actions.close,
        ['<Tab>'] = false,
        ['<C-q>'] = false,
      },
      n = {
        ['l'] = actions.select_default + actions.center,
        ['q'] = actions.close,
        ['v'] = actions.toggle_selection,
        ['J'] = actions.toggle_selection + actions.move_selection_worse,
        ['K'] = actions.toggle_selection + actions.move_selection_better,
        ['<esc>'] = actions.close,
        ['<Tab>'] = false,
        ['<C-q>'] = actions.close,
        ['s'] = false,
        ['S'] = false,
      },
    },
  },

  pickers = {
    find_files = {
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
      prompt_title = '',
      results_title = '',
      preview_title = '',
      theme = 'dropdown',
      previewer = false,
      borderchars = {
        prompt = { '─', '│', ' ', '│', '┌', '┐', '', '' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mappings = {
        i = {
          ['<C-f>'] = actions.close,
        },
        n = {
          ['<C-f>'] = actions.close,
        },
      },
    },
    live_grep = {
      layout_config = {
        width = 0.5,
        height = 0.4,
      },
      initial_mode = 'insert',
      prompt_title = '',
      theme = 'dropdown',
      previewer = false,
      borderchars = {
        prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mappings = {
        i = {
          ['<C-g>'] = actions.close,
        },
        n = {
          ['<C-g>'] = actions.close,
        },
      },
    },
    oldfiles = {
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
      prompt_title = '',
      results_title = '',
      preview_title = '',
      theme = 'dropdown',
      previewer = false,
      borderchars = {
        prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mappings = {
        i = {
          ['<C-h>'] = actions.close,
        },
        n = {
          ['<C-h>'] = actions.close,
        },
      },
    },
    jumplist = {
      layout_config = {
        preview_width = 0.6,
        height = 0.65,
      },
      path_display = { 'shorten' },
      prompt_title = '',
      results_title = '',
      preview_title = '',
      initial_mode = 'normal',
      mappings = {
        i = {
          ['<C-j>'] = actions.close,
        },
        n = {
          ['<C-j>'] = actions.close,
        },
      },
    },
    keymaps = {
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
      prompt_title = '',
      results_title = '',
      preview_title = '',
      theme = 'dropdown',
      previewer = false,
      borderchars = {
        prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mappings = {
        i = {
          ['<C-k>'] = actions.close,
        },
        n = {
          ['<C-k>'] = actions.close,
        },
      },
    },
  },
  extensions = {
    file_browser = {
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
      theme = 'dropdown',
      prompt_title = '',
      results_title = '',
      preview_title = '',
      previewer = false,
      borderchars = {
        prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mappings = {
        n = vim.tbl_extend('force', fb_keybindings, {
          ['w'] = false,
          ['p'] = fb_action 'copy_file',
          ['cw'] = fb_action 'rename_file',
          ['h'] = fb_action 'goto_parent_dir',
          ['.'] = fb_action 'toggle_hidden',
          ['gh'] = fb_action 'goto_cwd',
        }),
      },
    },
  },
}

require('telescope').load_extension 'file_browser'
