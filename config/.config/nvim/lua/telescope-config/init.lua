require('telescope-config/keybindings')
require('telescope-config/options')

local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " ",
    initial_mode = "normal",
    results_title = "",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    color_devicons = true,
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
            -- file-browser extension keybindings
            ["h"] = fb_actions.goto_prev_dir,
            ["e"] = fb_actions.create_file,
            ["."] = fb_actions.toggle_hidden,
            ["x"] = fb_actions.remove_file,
            ["gh"] = fb_actions.goto_cwd,
            ["p"] = fb_actions.copy_file,
            ["r"] = fb_actions.rename_file,
        }
    },
  },

  pickers = {
    find_files = {
      layout_config = {
        height = 0.65,
      },
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
      mappings = {
        i = {},
        n = {
          ["h"] = false,
          ["e"] = false,
          ["."] = false,
          ["x"] = false,
          ["gh"] = false,
          ["p"] = false,
          ["r"] = false,
        },
      }
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
      mappings = {
        i = {},
        n = {
          ["h"] = false,
          ["e"] = false,
          ["."] = false,
          ["x"] = false,
          ["gh"] = false,
          ["p"] = false,
          ["r"] = false,
        },
      }
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
      mappings = {
        i = {},
        n = {
          ["h"] = false,
          ["e"] = false,
          ["."] = false,
          ["x"] = false,
          ["gh"] = false,
          ["p"] = false,
          ["r"] = false,
        },
      }
    },
    oldfiles = {
      layout_config = {
        height = 0.65,
      },
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
      mappings = {
        i = {},
        n = {
          ["h"] = false,
          ["e"] = false,
          ["."] = false,
          ["x"] = false,
          ["gh"] = false,
          ["p"] = false,
          ["r"] = false,
        },
      }
    },
  },
  extensions = {},
}
