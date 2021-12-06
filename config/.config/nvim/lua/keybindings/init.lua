local keys = require'utils.keybindings'

keys.bind_normal_mode {
  -- Disable wrapped line skips during vertical navigation
  {'j', 'gj'},
  {'k', 'gk'},
  -- Save & Source file
  {'<C-w>', '<CMD>w | so %<CR>'},
  -- Close all floating windows & delete buffer
  {'q', '<CMD>lua require"utils.init".close_float_win()<CR>'},
  -- Save all buffers and exit Vim
  {'<C-q>', '<CMD>wqa<CR>'},
  -- Used to quit splits
  {'Q', '<CMD>q<CR>'},
  -- -- Toggle mouse
  {'M', '<CMD>lua require"utils.init".toggle_mouse()<CR>'},
  -- Temporarily show file path in status bar
  {'<C-p>', '<CMD>lua require"utils.init".toggle_path()<CR>'},
  -- Split window vertically right
  {'<Leader>v', '<CMD>vsp<CR>'},
  -- Buffer navigation
  {'<S-l>', '<CMD>bn<CR>'},
  {'<S-h>', '<CMD>bp<CR>'},
  -- Split navigation
  {'<', '<C-w>h'},
  {'>', '<C-w>l'},
  {'<Left>', '<C-w>h'},
  {'<Right>', '<C-w>l'},
  {'<Up>', '<C-w>k'},
  {'<Down>', '<C-w>j'},
  -- Set current working directory to directory of opened file
  {'==', '<CMD>cd %:h<CR>'},
}

keys.bind_insert_mode {
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'},
}
-- Keybindings for wildmenu
-- vim.cmd[[
--   cnoremap <expr> K wildmenumode() ? "\<left>" : "K"
--   cnoremap <expr> J wildmenumode() ? "\<right>" : "J"
--   cnoremap <expr> H wildmenumode() ? "\<up>" : "H"
--   cnoremap <expr> L wildmenumode() ? "\<CR>" : "L"
-- ]]

-- keys.bind_expr_command_mode {
--   {'K', 'v:lua.wildm_up()'}
-- }
keys.bind_expr_command_mode {
  {'K', 'v:lua.wildm_up()'},
  {'J', 'v:lua.wildm_down()'},
  {'H', 'v:lua.wildm_left()'},
  {'L', 'v:lua.wildm_right()'},
}

keys.bind_command_mode {
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'},
}

keys.bind_terminal_mode {
  {'q','<C-\\><C-n>'}
}

