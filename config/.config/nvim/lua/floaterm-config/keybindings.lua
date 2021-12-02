
local K = require('utils.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-l>', '<CMD>FloatermNew --height=0.8 --width=0.7 --name=LazyGit --title=──LazyGit lazygit<CR>'},
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-n>', '<CMD>FloatermNew<CR>'},
  {'<', '<CMD>FloatermPrev<CR>'},
  {'>', '<CMD>FloatermNext<CR>'},
  {'q', '<CMD>FloatermKill<CR>'},
  {'<C-q>', '<CMD>FloatermKill!<CR>'}
})
