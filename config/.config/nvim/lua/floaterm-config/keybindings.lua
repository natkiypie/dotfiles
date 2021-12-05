
local K = require('utils.init')

K.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-l>', '<CMD>FloatermNew --name=LazyGit --title=─ lazygit<CR>h'},
  {'<C-m>', '<CMD>FloatermNew --name=Glow --title=─ glow_script.sh<CR>'},
  {'<F7>', '<CMD>FloatermNew --wintype=split --height=0.5 --name=htop htop -p `pidof vim`<CR>'},
  {'<F5>', '<CMD>FloatermNew --wintype=split --height=0.5 --name=node node<CR>'},
})

K.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-n>', '<CMD>FloatermNew<CR>'},
  {'<C-f>', '<CMD>lua require"utils.init".toggle_ft_winsize()<CR>'},
  {'<', '<CMD>FloatermPrev<CR>'},
  {'>', '<CMD>FloatermNext<CR>'},
  {'q', '<CMD>FloatermKill<CR>'},
  {'<C-q>', '<CMD>FloatermKill!<CR>'}
})
