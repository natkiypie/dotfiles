require('telescope-config/keybindings')
require('telescope-config/options')
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.5,
      height = 0.75,
      prompt_position = "top",
      preview_cutoff = 500,
      horizontal = {mirror = false},
      vertical = {mirror = false},
    },
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " ",
    initial_mode = "insert",
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
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.close,
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default + actions.center,
            ["<Tab>"] = actions.select_default + actions.center
        },
        n = {
            ["<C-q>"] = actions.close,
            ["q"] = actions.close,
            ["<Tab>"] = actions.select_default + actions.center
        }
    },
  }
}
