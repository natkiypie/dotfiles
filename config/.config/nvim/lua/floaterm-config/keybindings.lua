local keys = require('utils.keybindings')

keys.bind_normal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-l>', '<CMD>FloatermNew --name=LazyGit --title=─ lazygit<CR>'},
  {'<C-m>', '<CMD>FloatermNew --name=Glow --title=─ glow_script.sh<CR>'},
  {'<F7>', '<CMD>FloatermNew --wintype=split --height=0.5 --name=htop htop -p `pidof vim`<CR>'},
  -- {'<C-n>', '<CMD>FloatermNew --name=node node<CR><C-l><C-\\><CMD>let chnl = &channel<CR><CMD>FloatermToggle<CR><CMD>let b:slime_config = {"jobid": chnl}<CR><CMD>echo "Node.js REPL @" chnl<CR>'},
  {'<C-n>', '<CMD>FloatermNew --wintype=split node<CR><C-l><C-\\><CMD>let chnl = &channel<CR><CMD>FloatermToggle<CR><CMD>let b:slime_config = {"jobid": chnl}<CR><CMD>echo "Node.js REPL @" chnl<CR>'},
})

keys.bind_terminal_mode({
  {'<C-t>', '<CMD>FloatermToggle<CR>'},
  {'<C-f>', '<CMD>lua require"utils.init".toggle_ft_winsize()<CR>'},
  {'<', '<CMD>FloatermPrev<CR>'},
  {'>', '<CMD>FloatermNext<CR>'},
  {'<C-q>', '<CMD>FloatermKill!<CR>'}
})
