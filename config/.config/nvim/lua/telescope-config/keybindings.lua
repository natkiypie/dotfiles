local keys = require 'utils.keybindings'

keys.bind_normal_mode {
  { '<C-b>', '<CMD>Telescope buffers<CR>' },
  { '<C-f>', '<CMD>Telescope find_files<CR>' },
  { '<F9>', '<CMD>Telescope live_grep<CR>' },
  { '<C-h>', '<CMD>Telescope oldfiles<CR>' },
  { '<C-j>', '<CMD>Telescope jumplist<CR>' },
  { '<C-k>', '<CMD>Telescope keymaps<CR>' },
  {
    '<C-s>',
    '<CMD>lua require"session-lens".setup { theme_conf = { borderchars = { { "─", "│", "─", "│", "┌", "┐", "┘", "└"}, prompt = {"─", "│", " ", "│", "┌", "┐", "│", "│"}, results = {"─", "│", "─", "│", "├", "┤", "┘", "└"}, preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"}, } }, } ; require"session-lens".search_session()<CR>',
  },
  {
    '<C-e>',
    '<CMD>lua require "telescope".extensions.file_browser.file_browser( require("telescope.themes").get_dropdown { layout_config = { width = 0.5, height = 0.5, }, prompt_title = "", results_title = "", previewer = false, borderchars = { prompt = {"─", "│", " ", "│", "┌", "┐", "│", "│"}, results = {"─", "│", "─", "│", "├", "┤", "┘", "└"}, preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"}, }, } )<CR>',
  },
}
