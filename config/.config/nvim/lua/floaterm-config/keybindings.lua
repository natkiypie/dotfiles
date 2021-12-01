
local K = require('utils.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-l>', '<CMD>FloatermNew --height=0.8 --width=0.7 --name=LazyGit --title=──LazyGit lazygit<CR>'},
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<S-n>', '<CMD>FloatermNew<CR>'},
  {'H', '<CMD>FloatermPrev<CR>'},
  {'L', '<CMD>FloatermNext<CR>'},
  {'q', '<CMD>FloatermKill<CR>'},
  {'<ESC>', '<CMD>FloatermKill!<CR>'}
})
