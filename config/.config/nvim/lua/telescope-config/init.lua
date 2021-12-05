require('telescope-config/keybindings')
require('telescope-config/options')

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.5,
      height = 0.75,
      prompt_position = "top",
      preview_cutoff = 100,
      horizontal = {mirror = false},
      vertical = {mirror = false},
    },
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    color_devicons = false,
    set_env = {['COLORTERM'] = 'truecolor'},
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
        i = {
            ["J"] = actions.move_selection_next,
            ["K"] = actions.move_selection_previous,
            ["L"] = actions.select_default + actions.center,
            ["Q"] = actions.close,
            ["<esc>"] = actions.close,
            ["<Tab>"] = false,
            ["<C-q>"] = false,
        },
        n = {
            ["l"] = actions.select_default + actions.center,
            ["q"] = actions.close,
            [" "] = actions.toggle_selection,
            ["J"] = actions.toggle_selection + actions.move_selection_worse,
            ["K"] = actions.toggle_selection + actions.move_selection_better,
            ["<esc>"] = actions.close,
            ["<Tab>"] = false,
            ["<C-q>"] = false,
        }
    },
  },

  pickers = {
    find_files = {
      prompt_title = "Files",
      theme = "dropdown",
      previewer = false,
      border = {},
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
      layout_config = {
        height = 0.65,
      },
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      border = {},
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
    },
    file_browser = {
      prompt_title = "Explorer",
      theme = "dropdown",
      previewer = false,
      border = {},
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
    },
    live_grep = {
      prompt_title = "Grep",
      theme = "dropdown",
      previewer = false,
      border = {},
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
    },
    oldfiles = {
      prompt_title = "History",
      theme = "dropdown",
      previewer = false,
      border = {},
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
      layout_config = {
        height = 0.65,
      },
    },
  },
  extensions = {
  },
}
