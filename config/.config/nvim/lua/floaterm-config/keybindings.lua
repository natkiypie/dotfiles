
local K = require('utils.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-l>', '<CMD>FloatermNew --height=0.99 --width=0.99 --name=LazyGit --title=─ lazygit<CR>'},
  {'<C-m>', '<CMD>FloatermNew --height=0.99 --width=0.99 --name=Glow --title=─ glow_script.sh<CR>'},
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-n>', '<CMD>FloatermNew<CR>'},
  {'<', '<CMD>FloatermPrev<CR>'},
  {'>', '<CMD>FloatermNext<CR>'},
  {'q', '<CMD>FloatermKill<CR>'},
  {'<C-q>', '<CMD>FloatermKill!<CR>'}
})
