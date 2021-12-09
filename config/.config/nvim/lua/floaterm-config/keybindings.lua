local keys = require'utils.keybindings'

keys.bind_normal_mode {
  {'<C-t>', '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal"}<CR>'},
  -- {'<C-l>', '<CMD>lua require"floaterm-config.utils".toggle{name="LazyGit", cmd="lazygit"}<CR>'},
  {'<C-c>', '<CMD>lua require"floaterm-config.utils".toggle{name="Glow", cmd="glow_script.sh"}<CR>'},
  {'<F7>', '<CMD>lua require"floaterm-config.utils".toggle{wintype="split", height="0.5", name="htop", cmd="htop -p `pidof vim`"}<CR>'},
  -- {'<C-n>', '<CMD>FloatermNew --wintype=split node<CR><C-l><C-\\><CMD>let chnl = &channel<CR><CMD>FloatermToggle<CR><CMD>let b:slime_config = {"jobid": chnl}<CR><CMD>echo "Node.js REPL @" chnl<CR>'},
  {'<C-n>', '<CMD>lua require"floaterm-config.utils".slime()<CR>'},
}

keys.bind_terminal_mode {
  {'<C-t>', '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal"}<CR>'},
  -- {'<C-l>', '<CMD>lua require"floaterm-config.utils".toggle{name="LazyGit"}<CR>'},
  {'<C-c>', '<CMD>lua require"floaterm-config.utils".toggle{name="Glow"}<CR>'},
  {'<C-n>', '<CMD>lua require"floaterm-config.utils".toggle{name="REPL"}<CR>'},
  {'<F7>', '<CMD>lua require"floaterm-config.utils".toggle{name="htop"}<CR>'},
  {'<C-f>', '<CMD>lua require"floaterm-config.utils".toggle_winsize()<CR>'},
  {'<', '<CMD>FloatermPrev<CR>'},
  {'>', '<CMD>FloatermNext<CR>'},
  {'q', '<CMD>lua require"floaterm-config.utils".quit()<CR>'},
  {'<C-q>', '<CMD>lua require"floaterm-config.utils".quit_all()<CR>'},
}
