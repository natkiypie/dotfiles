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
  {'<C-p>', '<CMD>lua require"utils.global".toggle_path()<CR>'},
  -- Split window vertically right
  {'<Leader>v', '<CMD>vsp<CR>'},
  -- Buffer navigation
  {'<S-l>', '<CMD>bn<CR>'},
  {'<S-h>', '<CMD>bp<CR>'},
  -- Split navigation
  -- THIS WILL BE AN <expr> MAPPING - I WANT TO BE ABLE TO USE THESE KEYS TO QUICKLY INDENT
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

keys.bind_command_mode {
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'},
}

keys.bind_terminal_mode {
  {'<ESC>','<C-\\><C-n>'}
}

keys.bind_expr_command_mode {
  {'<C-k>', 'v:lua.wildm("\\<Left\\>")'},
  {'<C-j>', 'v:lua.wildm("\\<Right\\>")'},
  {'<C-h>', 'v:lua.wildm("\\<Up\\>")'},
  {'<C-l>', 'v:lua.wildm("\\<CR\\>")'},
}

