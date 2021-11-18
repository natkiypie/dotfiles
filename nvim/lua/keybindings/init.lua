local K = require('util.init')

K.bind_normal_mode({
  -- Disable wrapped line skips during vertical navigation
  {'j', 'gj'},
  {'k', 'gk'},
  -- Save & Source file
  {'<C-w>', '<CMD>w | so %<CR>'},
  -- Close all floating windows & delete buffer
  {'<C-q>', '<CMD>lua require"util.init".close_float_win()<CR>'},
  -- Save all buffers and exit Vim
  {'Q', '<CMD>q<CR>'},
  -- Toggle mouse
  {'<C-m>', '<CMD>lua require"util.init".toggle("set", "mouse", {"a", ""})<CR>'},
  -- Temporarily show file path in status bar
  {'<C-p>', '<CMD>lua require"util.init".toggle_path()<CR>'},
  -- Split window vertically right
  {'<Leader>v', '<CMD>vsp<CR>'},
  -- Switch between split windows
  {'<C-h>', '<C-w>h'},
  {'<C-l>', '<C-w>l'},
  -- move current line down
  {'<C-j>', '<CMD>m+1<CR>'},
  -- move current line up
  {'<C-k>', '<CMD>m-2<CR>'},
})

K.bind_insert_mode({
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'},
})

K.bind_command_mode({
  -- Use keys 'jk' to exit insert mode
  {'jk', '<ESC>'}
})
