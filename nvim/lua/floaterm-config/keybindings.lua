
local K = require('util.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'}
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-n>', '<CMD>FloatermNew<CR>'},
  {'<C-h>', '<CMD>FloatermPrev<CR>'},
  {'<C-l>', '<CMD>FloatermNext<CR>'},
  {'<C-q>', '<CMD>FloatermKill<CR>'},
  {'<ESC>', '<CMD>FloatermKill!<CR>'}
})
