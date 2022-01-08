require('utils.keybindings').bind_normal_mode {
  { '<C-_>', '<CMD>CommentToggle<CR>' },
  { '<C-p>', 'vip:CommentToggle<CR>' },
  { 'clp', 'yy:CommentToggle<CR>p' },
  { '<C-c><C-p>', '}o<ESC>2kyipvip:CommentToggle<CR>}p' },
}

require('utils.keybindings').bind_visual_mode {
  { '<C-_>', ':CommentToggle<CR>' },
  { '<C-c><C-p>', 'yv`]:CommentToggle<CR>`]p' },
  { '<C-c><C-y>', 'yv`]:CommentToggle<CR>' },
}