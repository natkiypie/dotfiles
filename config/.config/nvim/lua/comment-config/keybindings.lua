local keys = require 'utils.keybindings'

keys.bind_normal_mode {
  { '<C-_>', '<CMD>CommentToggle<CR>' },
  { '<C-_><C-_>', 'vip:CommentToggle<CR>' },
  { 'clp', 'yy:CommentToggle<CR>p' },
  { '<C-c><C-p>', '}o<ESC>2kyipvip:CommentToggle<CR>}p' },
}

keys.bind_visual_mode {
  { '<C-_>', ':CommentToggle<CR>' },
  { '<C-c><C-p>', 'yv`]:CommentToggle<CR>`]p' },
}
