local keys = require'utils.keybindings'

keys.bind_normal_mode {
  -- Disable wrapped line skips during vertical navigation
  {'j', 'gj'},
  {'k', 'gk'},
  -- Save & Source file
  {'<C-w>', '<CMD>w | so %<CR>'},
  -- Close all floating windows & delete buffer
  {'q', '<CMD>lua require"utils.global".close_float_win()<CR>'},
  -- Save all buffers and exit Vim
  {'<C-q>', '<CMD>wa | qa<CR>'},
  -- Used to quit splits
  {'Q', '<CMD>q<CR>'},
  -- -- Toggle mouse
  {'M', '<CMD>lua require"utils.global".toggle_mouse()<CR>'},
  -- Temporarily show file path in status bar
  {'<Leader>p', '<CMD>lua require"utils.global".toggle_path()<CR>'},
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
  -- Surround word under cursor with single quotes (prefix with number to surround corresponding number of words with single quotes)
  {"'", "ciw''<Esc>P"},
  -- Surround word under cursor with double quotes (prefix with number to surround corresponding number of words with double quotes)
  {'"', 'ciw""<Esc>P'},
  -- Remove single quotes from cursor under word
  {"d;", "di'hPl2x"},
  -- Remove double quotes from cursor under word
  {"d'", 'di"hPl2x'},
  -- Yank block
  {"yb", 'vipy'},
  -- Yank block and put
  {'yp', '}o<ESC>2kvipy}p'},
}

keys.bind_insert_mode {
  {'jk', '<ESC>'},
}

-- Surround visual selection with single quotes
keys.bind_visual_mode {
  {"'", "c''<Esc>P"},
  {'"', 'c""<Esc>P'},
}

keys.bind_command_mode {
  {'q', '<ESC>'},
}

keys.bind_terminal_mode {
  {'<', '<C-\\><C-n><C-w>h'},
}

keys.bind_expr_command_mode {
  {'<C-k>', 'v:lua.wildm("\\<Left\\>")'},
  {'<C-j>', 'v:lua.wildm("\\<Right\\>")'},
  {'<C-h>', 'v:lua.wildm("\\<Up\\>")'},
  {'<C-l>', 'v:lua.wildm("\\<CR\\>")'},
}

