local bind_normal_mode = require('utils.keybindings').bind_normal_mode

bind_normal_mode {
  { '<F9>', '<CMD>Telescope live_grep<CR>' },
  -- {
  --   '<C-l>',
  --   '<CMD>lua require"session-lens".setup { layout_config = { width = 0.5, height = 0.5, }, prompt_title = "", results_title = "", preview_title = "", theme_conf = { borderchars = { { "─", "│", "─", "│", "┌", "┐", "┘", "└"}, prompt = {"─", "│", " ", "│", "┌", "┐", "│", "│"}, results = {"─", "│", "─", "│", "├", "┤", "┘", "└"}, preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"}, } }, } ; require"session-lens".search_session()<CR>',
  -- },
}
