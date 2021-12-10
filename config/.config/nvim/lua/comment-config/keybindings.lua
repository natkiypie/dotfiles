local keys = require'utils.keybindings'

keys.bind_normal_mode {
  {'<C-_>', '<CMD>CommentToggle<CR>'},
  {'<C-_><C-_>', 'vip:CommentToggle<CR>'},
  {'cp', 'yy:CommentToggle<CR>p'},
  {'<C-c><C-p>', '}o<ESC>2kvipyvip:CommentToggle<CR>}p'},
}

keys.bind_visual_mode {
  {'<C-_>', ':CommentToggle<CR>'},
}
