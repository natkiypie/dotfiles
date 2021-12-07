local keys = require'utils.keybindings'

keys.bind_normal_mode {
  {'<C-_>', '<CMD>CommentToggle<CR>'},
}

keys.bind_visual_mode {
  {'<C-_>', ':CommentToggle<CR>'},
}
