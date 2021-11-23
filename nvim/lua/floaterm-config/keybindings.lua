
local K = require('util.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  -- Lazygit
  {'<C-g>', '<CMD>FloatermNew --height=0.8 --width=0.7 --name=LazyGit --title=──LazyGit lazygit<CR>'},
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-n>', '<CMD>FloatermNew<CR>'},
  {'<C-h>', '<CMD>FloatermPrev<CR>'},
  {'<C-l>', '<CMD>FloatermNext<CR>'},
  {'<C-q>', '<CMD>FloatermKill<CR>'},
  {'<ESC>', '<CMD>FloatermKill!<CR>'}
})
