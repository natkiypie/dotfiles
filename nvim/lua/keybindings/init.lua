local K = require('utils.init')

K.bind_normal_mode({
  -- Disable wrapped line skips during vertical navigation
  {'j', 'gj'},
  {'k', 'gk'},
  -- Save & Source file
  {'<C-w>', '<CMD>w | so %<CR>'},
  -- Close all floating windows & delete buffer
  {'q', '<CMD>lua require"utils.init".close_float_win()<CR>'},
  -- Save all buffers and exit Vim
  {'<C-q>', '<CMD>q<CR>'},
  -- Remove keybinding for shit+q
  {'Q', '<Nop>'},
  -- Toggle mouse
  -- {'<C-m>', '<CMD>lua require"utils.init".toggle("set", "mouse", {"a", ""})<CR>'},
  {'<C-m>', '<CMD>lua require"utils.init".toggle("set", "mouse", {"a", ""})<CR>'},
  -- Temporarily show file path in status bar
  {'<C-p>', '<CMD>lua require"utils.init".toggle_path()<CR>'},
  -- Split window vertically right
  {'<Leader>v', '<CMD>vsp<CR>'},
  -- Split navigation
  {'<Left>', '<C-w>h'},
  {'<Right>', '<C-w>l'},
  {'<Up>', '<C-w>k'},
  {'<Down>', '<C-w>j'},
  {'<C-h>', '<C-w>h'},
  {'<C-l>', '<C-w>l'},
  {'<C-k>', '<C-w>k'},
  {'<C-j>', '<C-w>j'},
})

K.bind_insert_mode({
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'},
})

K.bind_command_mode({
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'}
})
